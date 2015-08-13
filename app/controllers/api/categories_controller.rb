class Api::CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
  end

  def index
    @categories = Category.all
    render json: @categories
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
