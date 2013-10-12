class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :participant_id
      t.integer :event_date_id
      t.string :times

      t.timestamps
    end
  end
end
