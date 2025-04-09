class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_rich_text :content
  validates :content, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
