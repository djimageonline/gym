class ExercisesController < ApplicationController
  require 'http'

  def index
  
    muscle = 'biceps'
    response_url = "https://api.api-ninjas.com/v1/exercises?muscle=#{muscle}"

    # response = HTTP.get(response_url, headers ={ "Authorization" => "Bearer #{Rails.application.credentials.gym_api[:api_key]}"}).json
    
    response = HTTP.get(response_url, headers: { 'X-Api-Key' => "#{Rails.application.credentials.gym_api[:api_key]}"})

    p "test1"

    pp Rails.application.credentials.gym_api[:api_key]

    show = response.parse(:json)
    pp show

  
    # exercise_names = []

    # while index < show.length
    #   exercise_names << show[index]["name"]
    #   index += 1
    # end

    # if !show[0]["name"]
    #   render json: [].as_json
    # else
    #   render json:  show.as_json
    # end
  end

  def show
    @exercise = Exercise.find_by(id: params[:id])
    render json: @exercise.as_json
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
