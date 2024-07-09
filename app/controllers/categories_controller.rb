class CategoriesController < ApplicationController
    before_action :set_category, only: [:show]
  
    # GET /categories/1
    def show
      respond_to do |format|
        format.html # Renders show.html.erb by default
        format.json { render json: @category } # Responds with JSON
      end
    end
  
    # GET /categories/new
    def new
      @category = Category.new
    end
  
    # POST /categories
    def create
      @category = Category.new(category_params)
  
      if @category.save
        redirect_to category_path(@category), notice: 'Category was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_category
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Category not found"
      redirect_to categories_path  # Redirect to index or root_path as appropriate
    end
  
    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
  