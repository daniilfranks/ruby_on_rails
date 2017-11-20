class Homework < ApplicationRecord
  has_many :category_homeworks
  has_many :categories, through: :category_homeworks, dependent: :destroy

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }

  attr_accessor :new_category_name
  before_save :create_category_from_name

  def create_category_from_name
    Category.create(name: new_category_name) if new_category_name.present?
  end
end
