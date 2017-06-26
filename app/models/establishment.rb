class Establishment < ApplicationRecord

  include PgSearch

  belongs_to :user

  has_many :courses, dependent: :destroy

  # validates :street, presence: true
  validates :country, presence: true
  validates :city, presence: true

  geocoded_by :address
  after_validation :geocode, if: :street_changed?


   multisearchable :against => [:name, :description]

  def self.geocode_all
    self.all.map { |model| model.geocode && model.save }
  end

  def address
    [self.street, self.postal_code, self.city, self.country].select{|i| i}.join(", ")
  end
end
