class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :reviews

  validates :date, presence: true

  # has_many :reviews, :through => :appointments, :source =>
end
