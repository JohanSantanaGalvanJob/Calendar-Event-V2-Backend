class CreatingForeignKeyToEvents < ActiveRecord::Migration[7.2]
  def change

    remove_column :events, :event_category_id
    remove_column :events, :location_id

    add_reference :events, :event_category, foreign_key: true
    add_reference :events, :location, foreign_key: true
  end
end
