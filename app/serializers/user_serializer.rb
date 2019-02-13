class UserSerializer < ActiveModel::Serializer
  attributes %i[id username]
  has_many :reviews
end
