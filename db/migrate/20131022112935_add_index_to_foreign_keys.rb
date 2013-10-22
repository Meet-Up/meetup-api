class AddIndexToForeignKeys < ActiveRecord::Migration
  def change
    add_index :availabilities, :participant_id
    add_index :availabilities, :event_date_id
    add_index :event_dates, :event_id
    add_index :participants, :event_id
  end
end
