class CategoriesController < ApplicationController
  def index
    @categories = Category.newest_first
  end

  def show
    @category = Category.find(params[:id])
  end
end
