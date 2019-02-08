class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :author_nickname, :published_at, :post_id, :child_comments

  has_many :child_comments

  def author_nickname
    object.author.nickname
  end

end
