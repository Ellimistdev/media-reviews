class ViewSerializer < ActiveModel::Serializer
  attributes %i[id medium_id user_id title created_at] 

  def title
    object.medium.element.title
  end
end
