class Post < ApplicationRecord
  paginates_per 10

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments

  validates :title, :body, presence: true

  before_validation :check_published_at

  def check_published_at
    self.published_at = Time.now if published_at.blank?
  end

end
