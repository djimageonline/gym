class RoutinesController < ApplicationController
  # before_action :authenticate_user


  def index
    @routines = current_user.routines
    render template: "routines/index"
  end

  def show
    @routine = current_user.routines.find_by(
      id: params[:id]
    )

    if @routine
      render template: "routines/show"
    else
      render json: {errors: @routine.errors.full_messages},
      status: 422
    end
  end

  def create
    @routine = Routine.new(
      user_id:current_user.id,
      name:params[:name]
    )
    
    if @routine.save
      render template: "routines/show"
    else
      render json: { errors: @routine.errors.full_messages }, status: 422
    end
  end

  def update
    @routine = Routine.find_by(id: params[:id])
    @routine.name = params[:name] || @routine.name
    if @routine.save
      render template: "routines/show"
    else
      render json: { errors: @routine.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @routine_id = params[:id]
    @routine = Routine.find(@routine_id)

    @routine.destroy
    render json: {message: "This has been destroyed"}
  end  


end
