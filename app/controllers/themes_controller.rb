class ThemesController < ApplicationController

  before_filter :find_category
  before_filter :find_user

  def index
    @themes = Theme.where(:category_id => @category.id)
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new(:category_id => @category.id)
  end

  def create

  end

  private

  def find_category
    if params[:category_id]
      @category = Category.find_by_id(params[:category_id])
    end
  end

  def find_user
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
    end
  end
end
