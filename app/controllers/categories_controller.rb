class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end

  def new
    @category = Category.new
  end

  def edit
    # Edit action logic for categories
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
   
    @category.tasks.destroy_all
    redirect_to categories_url, notice: 'Category and associated tasks were successfully deleted.'
  end
  

  private

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Category not found"
    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
