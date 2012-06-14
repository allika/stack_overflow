class ThemesController < ApplicationController
  def index
    @themes = Theme.find_by_category_id(params[:category_id])
  end

  def show
  end
end
