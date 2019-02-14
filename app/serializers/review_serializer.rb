class ReviewSerializer < ActiveModel::Serializer
  attributes %i[id content rating medium_title]
  belongs_to :reviewer
  belongs_to :medium 

  def medium_title
    object.medium.element.title
  end
end
