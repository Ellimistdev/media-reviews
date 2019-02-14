class MovieSerializer < ActiveModel::Serializer
  attributes %i[id medium_id title]
  has_many :reviews
end
