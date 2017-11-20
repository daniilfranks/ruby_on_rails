class Category < ApplicationRecord
  has_many :category_homeworks
  has_many :homeworks, through: :category_homeworks, dependent: :destroy
end
