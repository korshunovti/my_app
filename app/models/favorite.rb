class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :anime_title

  validates :user_id, uniqueness: { scope: :anime_title_id }
end