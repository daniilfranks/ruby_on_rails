class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, :description, presence: true
end
