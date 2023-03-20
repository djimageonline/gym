class ExerciseRoutinesController < ApplicationController

  def index
    @exercise_routine = ExerciseRoutine.all
    render json: @exercise_routine

  end
  
  def create
    exerciseId = params[:exercise]
    name = params[:name]
    type = params[:type]
    muscle = params[:muscle]
    equipment = params[:equipment]
    difficulty = params[:difficulty]
    instructions = params[:instructions]

    exercise = Exercise.find_by(
      name: params[:name]
    )
    
    if !exercise
      exercise = Exercise.new(
        name: name,
        type: type,
        muscle: muscle,
        equipment: equipment,
        difficulty: difficulty,
        instructions: instructions,
      )  
      exercise.save
    end

    
    exercise_routine = exerciseTour.new(
      user_id: current_user.id,
      exercise_id: exercise.id,
      tour_id: params[:tour]
    )
    
    if exercise_routine.save
      render json: exercise_routine.as_json
    else
      render json: { errors: exercise_routine.errors.full_messages }, status: 422
    end
  end

  def show
    @exercise_routine = exerciseTour.find_by(id: params[:id])
    render json: @exercise_routine
  end

  def destroy
    pp params
    @exercise_routine = exerciseTour.where(exercise_id: params[:brew_id], tour_id: params[:tour_id])
  
    @exercise_routine[0].destroy
    render json: {message: "This has been destroyed"}
  end  
end
