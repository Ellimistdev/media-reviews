class ViewSerializer < ActiveModel::Serializer
  attributes %i[id medium_id title]

  def title
    object.medium.element.title
  end
end
