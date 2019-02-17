class UserReviewSerializer < ActiveModel::Serializer
  attributes %i[id content rating medium_title medium_id]
  belongs_to :reviewer
  belongs_to :medium

  def medium_title
    object.medium.element.title
  end
end
