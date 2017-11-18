class CategoryHomework < ApplicationRecord
  belongs_to :category
  belongs_to :homework
end
