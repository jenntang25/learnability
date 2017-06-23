class Review < ApplicationRecord
  belongs_to :appointment
  belongs_to :course

  validates :stars, presence: true

end
