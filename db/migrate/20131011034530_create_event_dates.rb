class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.integer :event_id
      t.string :open_times

      t.timestamps
    end
  end
end
