class UserSerializer < ActiveModel::Serializer
  attributes %i[id username]
  has_many :reviews, serializer: UserReviewSerializer
  has_many :views
end
