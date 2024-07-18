require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  fixtures :categories, :tasks

  setup do
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should create category with task" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: "New Category", description: "New Category Description" } }
    end

    assert_redirected_to category_url(Category.last)
    assert_equal 1, Category.last.tasks.count  # Ensure a task is associated with the new category
  end

  test "should update category and task" do
    patch category_url(@category), params: { category: { name: @category.name, description: @category.description } }
    assert_redirected_to category_url(@category)
    assert_equal @category.tasks.count, @category.tasks.count  # Ensure tasks associated with category remain unchanged
  end

  test "should destroy category and associated tasks" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
    assert_equal 0, Task.where(category_id: @category.id).count  # Ensure associated tasks are deleted with category
  end
end
