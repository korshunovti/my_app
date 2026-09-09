class WorkController < ApplicationController
  # Отключаем проверку токена для AJAX-запросов, чтобы избежать ошибки 422
  skip_before_action :verify_authenticity_token, only: [:choose_theme, :display_theme]

  def index
    @selected_theme = "Выберите тему"
    @selected_image_name = "Выберите тему для отображения"
    # Для отображения формы нам понадобятся все темы
    @themes = Theme.all.pluck(:name)
  end

  def choose_theme
    @themes = Theme.all.pluck(:name)
    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript' }
    end
  end

  def display_theme
    theme_name = params[:theme]
    @themes = Theme.all.pluck(:name)

    if theme_name.present? && theme_name != "Выберите тему"
      theme = Theme.find_by(name: theme_name)
      if theme && theme.anime_titles.any?
        anime = theme.anime_titles.first
        @image_data = {
          theme: theme.name,
          name: anime.name,
          file: anime.file,
          index: 0,
          images_arr_size: theme.anime_titles.size
        }
      else
        @image_data = { theme: theme_name, name: "Нет аниме в этой теме" }
      end
    else
      @image_data = { theme: "Выберите тему", name: "Нет данных" }
    end

    respond_to :js
  end
end