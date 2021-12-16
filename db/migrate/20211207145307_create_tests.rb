class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0, null: false
      t.belongs_to :category, foreign_key: true, null: false
      t.belongs_to :author, foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
