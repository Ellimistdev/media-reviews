class Season < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError
  include Conceivable
  include Viewable
  include Reviewable
  belongs_to :series
  has_many :episodes
  before_validation :build_parents
  validates :series, presence: true
  validates :number, presence: true
  scope :in_series, ->(series_id) { where(series_id: series_id) }

  def title
    "#{series.title} - Season #{number}" if series
  end

  def children
    episodes.blank? ? nil : episodes
  end
end
