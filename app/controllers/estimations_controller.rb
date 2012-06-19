class EstimationsController < ApplicationController

  before_filter :find_comment

  def create
    @estimation = Estimation.new(params[:estimation])
    if @estimation.save
      redirect_to comments_path(:theme_id => @comment.theme_id)
    else
      flash[:error] = "Something goes wrong!"
      redirect_to comments_path(:theme_id => @comment.theme_id)
    end
  end

  private

  def find_comment
    if params[:estimation][:comment_id]
      @comment = Comment.find_by_id(params[:estimation][:comment_id])
    end
  end
end
