class Medium < ApplicationRecord  
  has_one :movie
  has_one :series
  has_one :season
  has_one :episode
end
