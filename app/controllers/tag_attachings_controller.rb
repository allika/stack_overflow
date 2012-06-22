class TagAttachingsController < ApplicationController

  before_filter :find_tag
  before_filter :find_comment

  def create
    @tag_attaching = TagAttaching.new(params[:tag_attaching])
    if @tag_attaching.save
      @current_tag_popularity = @tag.popularity + 1
      @tag.update_attributes!(:popularity => @current_tag_popularity)
      flash[:notice] = "Tag #{@tag.name} has been attached."
      redirect_to comments_path( :theme_id => @comment.theme_id )
    else
      flash[:error] = "Something goes wrong. Tag wasn't attached'"
      redirect_to comments_path( :theme_id => @comment.theme_id )
    end
  end

  private

  def find_tag
    if params[:tag_attaching][:tag_id]
      @tag = Tag.find_by_id(params[:tag_attaching][:tag_id])
    end
  end

  def find_comment
    if params[:tag_attaching][:comment_id]
      @comment = Comment.find_by_id(params[:tag_attaching][:comment_id])
    end
  end
end
