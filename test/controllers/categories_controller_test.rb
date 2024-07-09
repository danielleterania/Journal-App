require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # This setup block runs before each test. It assigns a fixture category to the instance variable @category
  setup do
    @category = categories(:one)
  end

  # Test to check if the show action works and responds with success for the given category
  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  # Test to check if the new action works and responds with success
  test "should get new" do
    get new_category_url
    assert_response :success
  end
end
