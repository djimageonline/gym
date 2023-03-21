class ExerciseRoutinesController < ApplicationController

  def index
    @exercise_routine = ExerciseRoutine.all
    render json: @exercise_routine

  end
  
  def create
    name = params[:name]
    exercise_type = params[:exercise_type]
    muscle = params[:muscle]
    equipment = params[:equipment]
    difficulty = params[:difficulty]
    instructions = params[:instructions]

    exercise = Exercise.find_by(
      name: params[:name]
    )
    
    # p "test1:"
    # pp exercise

    if !exercise
      exercise = Exercise.new(
        name: name,
        exercise_type: exercise_type,
        muscle: muscle,
        equipment: equipment,
        difficulty: difficulty,
        instructions: instructions
      )  
      exercise.save
    end

    
    exercise_routine = ExerciseRoutine.new(
      user_id: current_user.id,
      exercise_id: exercise.id,
      routine_id: params[:routine_id]
    )
    # p "test2:"
    # pp exercise_routine

    if exercise_routine.save
      render json: exercise_routine.as_json
    else
      render json: { errors: exercise_routine.errors.full_messages }, status: 422
    end
  end

  def show
    @exercise_routine = ExerciseRoutine.find_by(id: params[:id])
    render json: @exercise_routine
  end

  def destroy
    @exercise_routine = ExerciseRoutine.where(exercise_id: params[:exercise_id], routine_id: params[:routine_id])
  
    @exercise_routine[0].destroy
    render json: {message: "This has been destroyed"}
  end  
end
