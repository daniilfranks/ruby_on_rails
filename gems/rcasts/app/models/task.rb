class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  scope :position, -> { order(:position) }

  validates :title, :description, :priority, :position, presence: true
end
