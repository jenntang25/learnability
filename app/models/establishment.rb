class Establishment < ApplicationRecord

  include PgSearch

  belongs_to :user
  has_many :courses, dependent: :destroy
  validates :country, presence: true
  validates :city, presence: true
  geocoded_by :address
  after_validation :geocode, if: :street_changed?


   multisearchable :against => [:name, :description]


  def address
    "#{self.street}, #{self.postal_code}, #{self.city}, #{self.country}"
  end




end
