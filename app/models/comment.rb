class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  has_many :child_comments, class_name: 'Comment', foreign_key: 'comment_id'

  validates :body, :post_id, presence: true

  before_validation :check_published_at

  def check_published_at
    self.published_at = Time.now
  end

end
