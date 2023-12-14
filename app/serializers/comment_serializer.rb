class CommentSerializer < ActiveModel::Serializer
  attributes :id, :article_id, :commenter
  # belongs_to :article
end
