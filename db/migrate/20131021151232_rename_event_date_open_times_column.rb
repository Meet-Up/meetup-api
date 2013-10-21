class RenameEventDateOpenTimesColumn < ActiveRecord::Migration
  def change
    rename_column :event_dates, :open_times, :times
  end
end
