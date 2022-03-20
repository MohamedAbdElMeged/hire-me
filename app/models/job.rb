class Job < ApplicationRecord
  belongs_to :company
  belongs_to :location
  belongs_to :country
  has_and_belongs_to_many :skills
  scope :is_active, -> { where("is_active = true") }
  scope :is_not_active, -> { where("is_active = false") }

end
