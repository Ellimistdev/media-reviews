class ViewSerializer < ActiveModel::Serializer
  attributes %i[id medium_id user_id title]

  def title
    object.medium.element.title
  end
end
