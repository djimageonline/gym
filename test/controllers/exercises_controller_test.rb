require "test_helper"

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  
  test "index" do
    get "/exercises.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Exercise.count, data.length
  end

  test "create" do
    assert_difference "Exercise.count", 1 do 
      post "/exercises.json", params: { name: "Lunges", description: "Stretch legs then Lunge", image_url: "test.com", video_url: "video.com"}

      assert_response 200
    end
  end


end
