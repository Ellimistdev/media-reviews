class Season < ApplicationRecord
  belongs_to :medium
  belongs_to :series
  before_validation :build_parents
end
