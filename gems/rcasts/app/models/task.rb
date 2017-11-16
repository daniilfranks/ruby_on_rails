class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  scope :position, -> { order(:position).includes(:project, :user) }
  scope :last_day_tasks, -> { where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight).includes(:project, :user) }

  validates :title, uniqueness: { case_sensitive: false }
  validates :title, :description, :priority, :position, presence: true
end
