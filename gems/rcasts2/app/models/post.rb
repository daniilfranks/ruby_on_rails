class Post < ApplicationRecord
  validates :title, :description, presence: :true
  validates :title, :description, length: { minimum: 5 }

  belongs_to :category, optional: true
  belongs_to :user, optional: true

  has_many :post_tags
  has_many :tags, through: :post_tags, dependent: :destroy

  def self.from_today
    where("created_at >=?", Time.zone.today.beginning_of_day)
  end
end
