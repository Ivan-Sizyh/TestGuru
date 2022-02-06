class AddTimeToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time, :integer, null: false
  end
end
