class CommentsController < ApplicationController

  before_filter :find_theme

  def index
    @comments = Comment.sorted.where(:theme_id => @theme.id)
  end

  private

  def find_theme
    if params[:theme_id]
      @theme = Theme.find_by_id(params[:theme_id])
    end
  end
end
