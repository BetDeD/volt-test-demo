class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :author_nickname, :post_id

  # has_one :author
  # has_one :post
  has_many :child_comments

  def author_nickname
    object.author.nickname
  end

end
