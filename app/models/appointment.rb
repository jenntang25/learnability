class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :date, presence: true
  has_many :reviews
end
