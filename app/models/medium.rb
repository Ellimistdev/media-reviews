class Medium < ApplicationRecord
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :reviewer
  has_many :views
  has_many :viewers, through: :views, source: :viewer

  # Searches the respective media table for its id
  # e.g. if medium_type = 'Episode' query becomes: 
  # Episode.find_by(medium_id: id)
  def element
    medium_type.constantize.find_by(medium_id: id)
  end
end
