class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    render template: "exercises/index"
  end

  # def create
  #   @exercise = Exercise.new(
  #     user_id:current_user.id,
  #     name: params[:name],
  #     description: params[:description],
  #     image_url: params[:image_url],
  #     video_url: params[:video_url],
  #   )
  #   if @exercise.save
  #     render template: "exercises/show"
  #   else
  #     render json: {errors: @exercise.errors.full_messages},
  #     status: 422
  #   end

  # end

  def show
    @exercise = Exercise.find_by(id: params[:id])
    render template: "exercises/show"
  end

  # def update
  #   @exercise = Exercise.find_by(id: params[:id])
  #   @exercise.update(
  #     name: params[:name] || @exercise.name,
  #     description: params[:description]  || @exercise.description,
  #     image_url: params[:image_url]  || @exercise.image_url,
  #     video_url: params[:video_url]  || @exercise.video_url
  #   )

  #   if @exercise.save
  #     render template: "exercises/show"
  #   else
  #     render json: {errors: @exercise.errors.full_messages},
  #     status: 422
  #   end
  # end

  # def destroy
  #   @exercise = Exercise.find_by(id: params[:id])
  #   @exercise.destroy
  #   render json: { message: "Exercise destroyed successfully"}
  # end

end
