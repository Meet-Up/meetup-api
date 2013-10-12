# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  description     :string(255)
#  duration        :float
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  token           :string(255)
#

class Event < ActiveRecord::Base
  include Tokenable
  include PasswordAuthenticable

  has_many :dates, class_name: 'EventDate', dependent: :delete_all
  has_many :participants
  has_many :availabilities, through: :participants
  accepts_nested_attributes_for :dates

  validates :title, presence: true
  validates :duration, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 24
  }
  validates :dates, length: { minimum: 1 }

  def to_param
    token
  end

  def as_json(options={})
    super({ include: :dates }.merge(options))
  end
end
