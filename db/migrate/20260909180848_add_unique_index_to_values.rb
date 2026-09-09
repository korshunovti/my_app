class AddUniqueIndexToValues < ActiveRecord::Migration[7.1]
  def change
    add_index :values, [:user_id, :anime_title_id], unique: true
  end
end