class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.string :description, null: false
      t.string :event, null: false
      t.string :criterion, null: false

      t.timestamps
    end
  end
end
