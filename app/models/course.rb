class Course < ApplicationRecord
  belongs_to :establishment
  has_many :reviews, through: :appointments
  has_attachments :photos, maximum: 4
  validates :title, presence: true
  validates :price, presence: true
  validates :category,  presence: true
end
