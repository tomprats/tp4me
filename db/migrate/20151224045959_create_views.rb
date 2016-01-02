class CreateViews < ActiveRecord::Migration[5.0]
  def change
    create_table :views do |t|
      t.integer :link_id, index: true, null: false
      t.json :raw_data
      t.json :computed_data

      t.timestamps
    end
  end
end
