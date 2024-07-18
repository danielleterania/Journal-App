require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  fixtures :categories, :tasks, :users

  setup do
    @category = categories(:one)
    @task = tasks(:one)
    @user = users(:one)  # Assuming you have a fixture for users
    sign_in @user  # Use Devise's sign_in helper to sign in the user
  end

  test "should create task" do
    assert_difference('Task.count') do
      post category_tasks_url(@category), params: { task: { title: "New Task", description: "New Task Description", category_id: @category.id } }
    end

    assert_redirected_to category_task_url(@category, Task.last)
  end

  test "should update task" do
    patch category_task_url(@category, @task), params: { task: { title: @task.title, description: @task.description, category_id: @category.id } }
    assert_redirected_to category_task_url(@category, @task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete category_task_url(@category, @task)
    end

    assert_redirected_to category_tasks_url(@category)
  end

  test "should show today's tasks" do
    get today_category_tasks_url
    assert_response :success
  end
end
