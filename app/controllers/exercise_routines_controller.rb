class ExerciseRoutinesController < ApplicationController

  def index
    @exercise_routine = ExerciseRoutine.all
    render json: @exercise_routine

  end
  
  def create
    
    #Step1: locate brewery in database
    #Step2: if you dont find brewery , create that brewery in db
    #Step3: use brewery id (wether you found it or created it)  ----- These are done
    #Step4: get tours that belong to current user :name
    #Step5: create the brewery tour entry: 

    breweryId = params[:brewery]
    name = params[:name]
    street = params[:street]
    city = params[:city]
    state = params[:state]
    zip = params[:zip]
    url = params[:url]

    exercise = Exercise.find_by(
      name: params[:name]
    )
    
    if !brewery
      # address = "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zip]}"

      address = "#{street}, #{city}, #{state}, #{zip}"

      brewery = Brewery.new(
        name: name,
        address: address,
        description: url
      )  
      brewery.save
    end

    
    exercise_routine = BreweryTour.new(
      user_id: current_user.id,
      brewery_id: brewery.id,
      tour_id: params[:tour]
    )
    
    if exercise_routine.save
      render json: exercise_routine.as_json
    else
      render json: { errors: exercise_routine.errors.full_messages }, status: 422
    end
  end


  def show
    @exercise_routine = BreweryTour.find_by(id: params[:id])
    render json: @exercise_routine
  end

  def destroy
    pp params
    @exercise_routine = BreweryTour.where(brewery_id: params[:brew_id], tour_id: params[:tour_id])
  
    @exercise_routine[0].destroy
    render json: {message: "This has been destroyed"}
  end  








end
