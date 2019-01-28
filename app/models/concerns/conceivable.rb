module Conceivable
  # generate a model's parents if they don't exist.
  def build_parents
    self.build_medium(medium_type: self.class.to_s) unless medium_id
    if self.instance_of?(Episode)
      self.build_season unless season_id
      self.season.build_series unless season.series_id
    end
    if self.instance_of?(Season)
      self.build_series unless series_id
    end
  end
end