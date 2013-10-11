# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  description     :string(255)
#  hours           :float
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Event < ActiveRecord::Base
  has_many :dates, class_name: 'EventDate'
  accepts_nested_attributes_for :dates

  has_secure_password validations: false
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :title, presence: true
  validates :hours, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 24
  }
end
