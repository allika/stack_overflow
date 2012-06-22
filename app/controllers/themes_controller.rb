class ThemesController < ApplicationController

  before_filter :find_category
  before_filter :find_user

  def index
    @themes = Theme.where(:category_id => @category.id).sort_by_top_comment_rating
    @tags = Tag.order('name DESC')
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new(:category_id => @category.id)
  end

  def create
    @theme = Theme.new(params[:theme])
    if @theme.save
      flash[:notice] = 'Theme has been created'
      redirect_to :action => 'index', :category_id => @theme.category_id
    else
      render 'new'
    end
  end

  def destroy
    Theme.find(params[:id]).destroy
    flash[:notice] = 'Theme has been destroyed'
    redirect_to :action => 'index', :category_id => @category.id
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
