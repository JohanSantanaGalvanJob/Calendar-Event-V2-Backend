class CreateEventUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :event_users do |t|
      t.timestamps
    end
    add_reference :event_users, :user, foreign_key: true
    add_reference :event_users, :event, foreign_key: true
  end
end
