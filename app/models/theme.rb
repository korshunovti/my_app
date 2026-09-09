class Theme < ApplicationRecord
  has_many :anime_titles

  def display_name
    I18n.locale == :en && name_en.present? ? name_en : name
  end
end