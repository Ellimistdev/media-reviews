class SeasonSerializer < ActiveModel::Serializer
  attributes %i[id medium_id title]
  has_many :reviews
  has_many :children
  has_one :parent
end
