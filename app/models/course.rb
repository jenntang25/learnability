class Course < ApplicationRecord

  include PgSearch

CATEGORIES = %w(Leisure Sports Photography Programming Languages Cooking Entertainment Art Other)

  belongs_to :establishment
  has_many :reviews, through: :appointments, dependent: :destroy
  has_many :appointments
  has_attachments :photos, maximum: 4
  validates :title, presence: true
  validates :price, presence: true
  validates :category,  presence: true, inclusion: { in: Course::CATEGORIES, allow_nil: false }

  multisearchable against: [:title, :category, :description]


  def self.search(search)
   PgSearch.multisearch(search)
 end

end


