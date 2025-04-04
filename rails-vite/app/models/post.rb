class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :content, presence: true
  validates :category_id, presence: true
  validates :published, inclusion: { in: [true, false] }
  validates :user_id, presence: true
  validates :image_url, presence: true, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }
  validates :image_url, length: { maximum: 255 }

  scope :published, -> { where(published: true) }
  scope :recent, -> { order(created_at: :desc) }
end