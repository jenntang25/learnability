class Course < ApplicationRecord

  include PgSearch
  CATEGORIES = %w(Education Technology Business Sports Music Cooking Health Art Photography Entertainment)

belongs_to :establishment
has_many :reviews, through: :appointments, dependent: :destroy
has_many :appointments
has_attachments :photos, maximum: 1
validates :title, presence: true
validates :price, presence: true
validates :tag, presence: true, length: { maximum: 50 }
 #validates :photos, presence: true
 validates :category,  presence: true, inclusion: { in: Course::CATEGORIES, allow_nil: false }

 multisearchable against: [:title, :category, :description]


  CATEGORIES_MAPPING  = {
   "Sports" => "fa fa-futbol-o",
   "Education" => "fa fa-flask",
   "Technology" => "fa fa-code ",
   "Business" => "fa fa-line-chart ",
   "Music" => "fa fa-play ",
   "Cooking" => "fa fa-cutlery ",
   "Health" => "fa fa-heartbeat ",
   "Art" => "fa fa-paint-brush",
   "Photography" => "fa fa-camera-retro ",
   "Entertainment" => "fa fa-glass",
 }






 def self.search(search)
   PgSearch.multisearch(search)
 end

end


