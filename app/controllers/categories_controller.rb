class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @disaster = Category.all
  end

  def new
    @disaster = Category.new
  end

  def create
    @param = params.require(:category).permit(:category_type)
    @disaster = Category.new(@param)
    if @disaster.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @disaster = Category.find(params[:id])
  end

  def update
    @param = params.require(:category).permit(:category_type)
    @disaster = Category.find(params[:id])
    if @disaster.update(@param)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def show
    @disaster = Category.find(params[:id])
  end


  def destroy
    if @comment.destroy
      redirect_to categories_path(@post)
    end
  end

end
