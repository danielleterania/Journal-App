class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  

  def index
    @tasks = @category.tasks
  end

  def show
  end

  def new
    @task = @category.tasks.build
  end

  def edit
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to [@category, @task], notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to [@category, @task], notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to category_tasks_path(@category), notice: 'Task was successfully deleted.'
  end

  def today
    @tasks = @category.tasks.where(due_date: Date.today)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Category not found"
    redirect_to categories_path
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Task not found"
    redirect_to category_tasks_path(@category)
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :category_id)
  end
end
