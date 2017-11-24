class Post < ApplicationRecord
  validates :title, :description, presence: :true
  validates :title, :description, length: { minimum: 5 }
end
