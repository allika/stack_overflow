class TagsController < ApplicationController

  before_filter :find_comment_theme
  def index
    @tags = Tag.sorted
  end

  def new
    @tag = Tag.new()
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "Tag has been created"
        if params[:attached] == 'yes'
          TagAttaching.create(:tag_id => @tag.id, :comment_id => @comment.id, :user_id => @tag.user_id)
          @tag.update_attributes!(:popularity => 1)
          flash[:notice] += " and attached successfully"
        end
      redirect_to category_themes_path(:category_id => @theme.category_id)
    else
     render 'new'
    end
  end

  def destroy
    TagAttaching.find_by_tag_id(params[:id]).destroy
    Tag.find(params[:id]).destroy
    flash[:notice] = 'Tag has been destroyed'
    redirect_to :action => 'index'
  end

  private

  def find_comment_theme
    if params[:comment_id]
      @comment = Comment.find_by_id(params[:comment_id])
      @theme = Theme.find_by_id(@comment.theme_id)
    end
  end
end
