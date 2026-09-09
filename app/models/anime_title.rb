class AnimeTitle < ApplicationRecord
  belongs_to :theme
  has_many :values, dependent: :destroy
  has_many :favorites, dependent: :destroy

  scope :theme_images, -> (theme_id) { select('id','name','file','ave_value').where(theme_id: theme_id) }
  def display_name
    I18n.locale == :en && name_en.present? ? name_en : name
  end
end