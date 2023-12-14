class ArticleSerializer < ActiveModel::Serializer
  # attributes :id
  attributes :id, :title, :category, :author
  has_many :comments
end
