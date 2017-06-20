class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :date, presence: true
end
