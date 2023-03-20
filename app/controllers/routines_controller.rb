class RoutinesController < ApplicationController

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


end
