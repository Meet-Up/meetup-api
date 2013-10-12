# == Schema Information
#
# Table name: availabilities
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  event_date_id  :integer
#  times          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Availability < ActiveRecord::Base
  belongs_to :participant
  belongs_to :event_date

  validates :times, length: {is: 48}
end
