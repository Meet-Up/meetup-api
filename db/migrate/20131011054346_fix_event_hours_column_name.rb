class FixEventHoursColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :hours, :duration
  end
end
