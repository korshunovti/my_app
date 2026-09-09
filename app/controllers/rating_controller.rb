class RatingController < ApplicationController
  MIN_VOTES = 3
  TOP_SIZE = 10

  def index
    @overall = top_titles
    @by_theme = Theme.order(:name).map do |theme|
      [theme, top_titles(theme.id)]
    end
  end

  private

  def top_titles(theme_id = nil)
    scope = AnimeTitle.joins(:values)
    scope = scope.where(theme_id: theme_id) if theme_id

    scope
      .group('anime_titles.id')
      .having('COUNT(values.id) >= ?', MIN_VOTES)
      .order(Arel.sql('AVG(values.value) DESC'))
      .limit(TOP_SIZE)
      .select('anime_titles.*, AVG(values.value) AS avg_score, COUNT(values.id) AS votes_count')
  end
end
