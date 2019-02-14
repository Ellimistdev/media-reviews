class SeriesSerializer < ActiveModel::Serializer
  attributes %i[id medium_id title]
  has_many :reviews
  has_many :children
end
