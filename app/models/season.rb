class Season < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError
  include Conceivable
  include Viewable
  include Reviewable
  belongs_to :series
  has_many :episodes
  accepts_nested_attributes_for :episodes
  before_validation :build_parents
  validates :medium, presence: true, uniqueness: true
  validates :series, presence: true
  validates :number, presence: true
  validates_uniqueness_of :number, scope: :series_id
  scope :in_series, ->(series_id) { where(series_id: series_id) }

  def title
    "#{series.title} - Season #{number}" if series
  end

  def children
    episodes.blank? ? nil : episodes
  end

  def parent
    series
  end
end
