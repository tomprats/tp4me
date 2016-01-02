class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :uid, index: true, null: false
      t.string :url,              null: false
      t.integer :total_views, default: 0

      t.timestamps                null: false
    end
  end
end
