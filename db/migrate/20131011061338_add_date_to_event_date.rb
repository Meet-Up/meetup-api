class AddDateToEventDate < ActiveRecord::Migration
  def change
    add_column :event_dates, :date, :date
  end
end
