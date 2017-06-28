class Course < ApplicationRecord

  include PgSearch

CATEGORIES = %w(Leisure Sports Photography Programming Languages Cooking Entertainment Art)

CATEGORIES_MAPPING  = {
   "education" => "fa fa-futbol-o",
       "Sports" => "fa fa-futbol-o",
      "business" => "fa fa-futbol-o ",
       "Cooking" => "fa fa-futbol-o ",
       "Health" => "fa fa-futbol-o ",
       "Technology" => "fa fa-futbol-o ",
       "Music" => "fa fa-futbol-o ",
       "Photography" => "fa fa-futbol-o ",
       "Entertainment" => "fa fa-futbol-o",
       "Languages" => "fa fa-futbol-o ",
       "Leisure" => "fa fa-futbol-o ",
       "Programming" => "fa fa-futbol-o ",
       "Art" => "fa fa-paint-brush",
       }





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


