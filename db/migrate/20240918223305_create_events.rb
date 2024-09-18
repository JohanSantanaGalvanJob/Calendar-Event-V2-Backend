class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date
      t.string :starting_hour
      t.string :url
      t.integer :location_id
      t.integer :event_category_id

      t.timestamps
    end
  end
end
