class Episode < ApplicationRecord
  belongs_to :medium
  belongs_to :season
  before_validation :build_parents
end
