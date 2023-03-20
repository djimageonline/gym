class ExercisesController < ApplicationController
  require 'uri'
  require 'net/http'


  def index
  
    muscle = 'biceps'
    response_url = URI("https://api.api-ninjas.com/v1/exercises?muscle=#{muscle}")
    headers = { 'X-Api-Key' => 'Gym_app_key', 'Content-Type' => 'application/json' }

    http = Net::HTTP.new(response_url.host, response_url.port)
    http.use_ssl = true # use HTTPS for secure connection
    request = Net::HTTP::Get.new(response_url, headers)
   
    response = http.request(request)
    if response.code == '200'
      puts response.body
    else
      puts "Error: #{response.code} - #{response.message}"
    end

    pp response_url
    
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
