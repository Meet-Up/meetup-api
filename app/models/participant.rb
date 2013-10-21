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

  validates :name, presence: true
  belongs_to :event
  has_many :availabilities

  accepts_nested_attributes_for :availabilities

  def as_json(options={})
    super({ include: :availabilities }.merge(options))
  end
end
