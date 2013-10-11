# == Schema Information
#
# Table name: event_dates
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  date       :date
#  open_times :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EventDate < ActiveRecord::Base
  belongs_to :event

  validates :open_times, length: {is: 48}
  validates_date :date, on_or_after: :now
end
