class Establishment < ApplicationRecord
  belongs_to :user
  has_many :courses
  validates :country, presence: true
  validates :city, presence: true
  geocoded_by :address
  after_validation :geocode, if: :street_changed?
  #add column title to establishment. erase this after done

  def address
    "#{self.street}, #{self.postal_code}, #{self.city}, #{self.country}"
  end
end
