class FavoritesController < ApplicationController
  PER_PAGE = 10

  def index
    @titles = current_user.favorite_titles
                          .includes(:theme)
                          .order(:id)
                          .page(params[:page])
                          .per(PER_PAGE)
  end
end
