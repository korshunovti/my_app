class ChangeValueToFloat < ActiveRecord::Migration[7.1]
  def up
    change_column :values, :value, :float
  end

  def down
    change_column :values, :value, :integer
  end
end