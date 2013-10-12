# == Schema Information
#
# Table name: participants
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  event_id        :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Participant < ActiveRecord::Base
  belongs_to :event
  has_many :availabilities

  has_secure_password validations: false
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
