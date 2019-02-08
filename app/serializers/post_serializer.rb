class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published_at, :author_nickname, :comments

  def author_nickname
    object.author.nickname
  end

end
