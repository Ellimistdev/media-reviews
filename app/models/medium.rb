class Medium < ApplicationRecord  
  has_one :movie
  has_one :series
  has_one :season
  has_one :episode

  # Searches the respective media table for its id
  # e.g. if medium_type = 'Episode' query becomes: 
  # Episode.find_by(medium_id: id)
  def element
    medium_type.constantize.find_by(medium_id: id)
  end
end
