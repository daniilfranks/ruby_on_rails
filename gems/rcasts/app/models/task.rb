class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  scope :position, -> { order(:position).includes(:project, :user) }

  validates :title, uniqueness: { case_sensitive: false }
  validates :title, :description, :priority, :position, presence: true
end
