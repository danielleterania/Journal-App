class Task < ApplicationRecord
  belongs_to :category
  validates :title, presence: true

  scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
end
