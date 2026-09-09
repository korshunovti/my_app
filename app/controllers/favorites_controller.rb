class FavoritesController < ApplicationController
  def index
    @titles = current_user.favorite_titles.includes(:theme).order(:id)
  end
end
