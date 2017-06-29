class Review < ApplicationRecord
  belongs_to :appointment
  belongs_to :course
  has_attachments :photos, maximum: 4
  validates :stars, presence: true

end
