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

    post "/exercise.json", params: {}
    assert_response 422
  end

  test "show" do
    get "/exercises/#{Exercise.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["name", "description", "image_url", "video_url"], data.keys
  end


  test "update" do
    exercise = Exercise.first
    patch "/exercises/#{exercise.id}.json", params: { name: "Updated Exercise"}
    assert_response 200
    
    data = JSON.parse(response.body)
    assert_equal "Updated Exercise", data["name"]
    assert_equal exercise.description, data["description"]


    patch "/exercise/#{exercise.id}.json", params: {name: ""}
    assert_response 422
  end

  test "destroy" do
    assert_difference "Exercise.count", -1 do
      delete "/exercises/#{Exercise.first.id}.json"
      assert_response 200
    end
  end

end
