module Api
  class GalleryController < ApplicationController
    skip_before_action :verify_authenticity_token, only: %i[ create_value toggle_favorite ]

    # GET /api/theme_titles?theme_id=1
    def theme_titles
      theme = Theme.find_by(id: params[:theme_id])

      if theme.nil?
        render json: { error: "Theme not found" }, status: :not_found
        return
      end

      favorite_ids = signed_in? ? current_user.favorites.pluck(:anime_title_id) : []
      user_values  = signed_in? ? current_user.values.pluck(:anime_title_id, :value).to_h : {}

      # Сколько всего оценок у каждого тайтла — от всех пользователей
      votes_counts = Value.where(anime_title_id: theme.anime_titles.select(:id))
                          .group(:anime_title_id).count

      titles = theme.anime_titles.order(:id).map do |title|
        {
          id: title.id,
          name: title.display_name,
          file: title.file,
          ave_value: title.ave_value&.to_f&.round(1),
          votes_count: votes_counts[title.id] || 0,
          favorited: favorite_ids.include?(title.id),
          user_value: user_values[title.id]&.to_f
        }
      end

      render json: {
        theme_id: theme.id,
        theme_name: theme.display_name,
        titles: titles
      }
    end

    # POST /api/values
    def create_value
      unless signed_in?
        render json: { error: t('gallery.auth_required') }, status: :unauthorized
        return
      end

      anime_title = AnimeTitle.find_by(id: params[:anime_title_id])

      if anime_title.nil?
        render json: { error: "Title not found" }, status: :not_found
        return
      end

      value = Value.find_or_initialize_by(
        user_id: current_user.id,
        anime_title_id: anime_title.id
      )
      value.value = params[:value].to_f

      if value.save
        render json: {
          status: "ok",
          user_value: value.value,
          ave_value: update_ave_value(anime_title),
          votes_count: anime_title.values.count
        }
      else
        render json: { errors: value.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # POST /api/favorites
    def toggle_favorite
      unless signed_in?
        render json: { error: t('gallery.auth_required') }, status: :unauthorized
        return
      end

      anime_title = AnimeTitle.find_by(id: params[:anime_title_id])

      if anime_title.nil?
        render json: { error: "Title not found" }, status: :not_found
        return
      end

      favorite = current_user.favorites.find_by(anime_title_id: anime_title.id)

      if favorite
        favorite.destroy
        render json: { favorited: false }
      else
        current_user.favorites.create(anime_title_id: anime_title.id)
        render json: { favorited: true }
      end
    end

    private

    def update_ave_value(anime_title)
      average = anime_title.values.average(:value)
      anime_title.update(ave_value: average)
      average&.to_f&.round(1)
    end
  end
end