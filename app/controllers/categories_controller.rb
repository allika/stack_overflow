class CategoriesController < ApplicationController
  def index
    @categories = Category.newest_first
  end

  def show
    @category = Category.find(params[:id])
    @themes = @category.themes
    render 'themes/index'
  end
end
