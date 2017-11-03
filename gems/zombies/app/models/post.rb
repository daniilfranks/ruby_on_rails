class Post < ApplicationRecord
  #default_score, -> { where(created_at: 1.day.ago) }

  scope :publishing_post, -> { where(publishing: true) }
  scope :no_publishing_post, -> { where(publishing: false) }
  scope :rating_post, -> { where("rating > 10") }
  scope :desc_post, -> { order("created_at desc").limit(5) }

  #before_save :increment_rating

  has_many :comments, dependent: :destroy

  private

  #def increment_rating
  #  self.rating += 1
  #end
end
