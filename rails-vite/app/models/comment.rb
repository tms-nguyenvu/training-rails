class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_rich_text :content
  validates :content, presence: true

  after_create_commit do
    broadcast_append_to "comments_for_post_#{post.id}",
    target: "comments",
    partial: "comments/shared/comment",
    locals: { comment: self, post: post }
  end

  after_destroy_commit do
    broadcast_remove_to "comments_for_post_#{post.id}",
    target: "comment-#{id}"
  end

  after_update_commit do
    broadcast_replace_to "comments_for_post_#{post.id}",
    target: "comment-#{id}",
    partial: "comments/shared/comment",
    locals: { comment: self, post: post }
  end

  scope :recent, -> { order(created_at: :desc) }
end
