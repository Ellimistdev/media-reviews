class MovieCollectionSerializer < ActiveModel::Serializer
  attributes %i[id medium_id title]
end
