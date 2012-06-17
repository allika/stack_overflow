class CommentsController < ApplicationController

  layout 'application'

  before_filter :find_theme
  before_filter :find_user

  def index
    @comments = Comment.sorted.where(:theme_id => @theme.id)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(:theme_id => @theme.id)
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment has been created'
      redirect_to :action => 'index', :theme_id => @comment.theme_id
    else
      render 'new'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = 'Comment has been destroyed'
    redirect_to :action => 'index', :theme_id => @theme.id
  end

  private

  def find_theme
    if params[:theme_id]
      @theme = Theme.find_by_id(params[:theme_id])
    end
  end

  def find_user
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
    end
  end
end
