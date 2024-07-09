require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  fixtures :categories

  setup do
    @category = categories(:one)
  end

  test "should show category" do
    get category_url(@category), as: :json # Specify format as JSON if needed
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: "Test Category", description: "Test Description" } }
    end

    assert_redirected_to category_url(Category.last)
  end
end
