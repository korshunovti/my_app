class AddNameEnToTitlesAndThemes < ActiveRecord::Migration[7.1]
  def change
    add_column :anime_titles, :name_en, :string
    add_column :themes, :name_en, :string
  end
end