class MediumSerializer < ActiveModel::Serializer    
  attributes %i[id medium_type title]  
  has_many :reviews  
  has_many :children
  has_one :parent  

  def title
    object.element.try(:title)
  end

  def children
    object.element.try(:children)
  end

  def parent    
    object.element.try(:parent)
  end
end
