class Establishment < ApplicationRecord
  belongs_to :user
  has_many :courses
  validates :country, presence: true
  validates :city, presence: true
  #add column title to establishment. erase this after done
end
