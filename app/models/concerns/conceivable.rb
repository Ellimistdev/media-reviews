module Conceivable
  def self.included(base)
    base.class_eval do
      belongs_to :medium
    end
  end

  # generate a model's parents if they don't exist.
  def build_parents
    build_medium(medium_type: self.class.to_s) unless medium_id
    # if instance_of?(Episode)
    #   build_season unless season_id
    #   season.build_series unless season.series_id
    # end
    # build_series if instance_of?(Season) && !series_id
  end
end
