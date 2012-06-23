class TagAttachingsController < ApplicationController

  before_filter :find_tag
  before_filter :find_comment_theme

  def create
    @tag_attaching = TagAttaching.new(params[:tag_attaching])
    if @tag_attaching.save
      @tag.update_popularity(1)
      flash[:notice] = "Tag #{@tag.name} has been attached."
      redirect_to category_themes_path( :category_id => @theme.category_id )
    else
      flash[:notice] = "Something goes wrong...Tag wasn't attached"
      redirect_to category_themes_path( :category_id => @theme.category_id )
    end
  end

  def destroy
    @tag_attaching = TagAttaching.find(params[:id]).destroy
    @tag.update_popularity(-1)
    flash[:notice] = "Tag has been detached"
    redirect_to category_themes_path( :category_id => @theme.category_id )
  end

  private

  def find_tag
    tag_id = if ( params[:tag_attaching] && params[:tag_attaching][:tag_id] )
                  params[:tag_attaching][:tag_id]
             elsif params[:id] then
                  TagAttaching.find_by_id(params[:id]).tag_id
              end
      @tag = Tag.find_by_id(tag_id)
  end

  def find_comment_theme
    comment_id = if ( params[:tag_attaching] && params[:tag_attaching][:comment_id] ) then
                      params[:tag_attaching][:comment_id]
                 elsif params[:id] then
                      TagAttaching.find_by_id(params[:id]).comment_id
                 end
      @comment = Comment.find_by_id(comment_id)
      @theme = Theme.find_by_id(@comment.theme_id)
  end
end
