class Episode < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError
  include Conceivable
  include Viewable
  include Reviewable
  belongs_to :season
  before_validation :build_parents
  validates :season, presence: true
  validates :title, presence: true
  scope :in_season, ->(season_id) { where(season_id: season_id) }
  scope :in_series, ->(series_id) { joins(:season).joins('LEFT JOIN series ON seasons.series_id = series.id').where('series.id = ?', series_id) }
end
