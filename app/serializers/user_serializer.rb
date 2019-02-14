class UserSerializer < ActiveModel::Serializer
  attributes %i[id username]
  has_many :views
end
