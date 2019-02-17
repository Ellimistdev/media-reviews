class ReviewSerializer < ActiveModel::Serializer
  attributes %i[id content rating reviewer]
  belongs_to :reviewer
  belongs_to :medium

  def reviewer
    reviewer = {
      id: object.reviewer.id,
      username: object.reviewer.username
    }
  end
end
