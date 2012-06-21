class TagsController < ApplicationController
  def index
    @tags = Tag.sorted
  end

  def destroy
    Tag.find(params[:id]).destroy
    flash[:notice] = 'Tag has been destroyed'
    redirect_to :action => 'index'
  end
end
