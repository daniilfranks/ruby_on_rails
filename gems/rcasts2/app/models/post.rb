class Post < ApplicationRecord
  validates :title, :description, presence: :true
  validates :title, :description, length: { minimum: 5 }

  belongs_to :category
  #belongs_to :user

  has_many :post_tags
  has_many :tags, through: :post_tags
end
