class Homework < ApplicationRecord
  has_many :category_homeworks
  has_many :categories, :through => :category_homeworks

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }
end
