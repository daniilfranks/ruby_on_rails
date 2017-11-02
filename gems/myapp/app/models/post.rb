class Post < ApplicationRecord
  before_validation :capitalize_title

  # Post.publication
  scope :publication, -> { where(publication: true) }

  has_many :comments, dependent: :destroy
  mount_uploader :img, ImgUploader
  paginates_per 2

  validates :title, presence: true,
                    length: { minimum: 5 },
                    uniqueness: true
  validates :publication, acceptance: true

  # Post.search { keywords 'ruby' }.results
  searchable do
    text :title
  end

  private
    def capitalize_title
      self.title.capitalize!
    end
end
