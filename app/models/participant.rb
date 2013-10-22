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
  include PasswordAuthenticable

  belongs_to :event
  has_many :availabilities

  accepts_nested_attributes_for :availabilities

  default_scope { includes(:availabilities) }

  validates :name, presence: true
  validate :all_dates_have_availabilities

  def as_json(options={})
    super({ include: :availabilities }.merge(options))
  end

  def all_dates_have_availabilities
    if event.dates.length != availabilities.length
      errors.add(:availabilities, 'wrong number of availabilities')
    end
  end
end
