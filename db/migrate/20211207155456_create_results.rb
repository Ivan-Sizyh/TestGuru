class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.boolean :status, default:false
      t.references :users,foreign_key: true, null: false
      t.references :tests,foreign_key: true, null: false

      t.timestamps
    end
  end
end
