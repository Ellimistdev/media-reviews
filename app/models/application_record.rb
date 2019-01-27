class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def build_parents
    self.build_medium(media_type: self.class.to_sym) unless medium_id
    if self.instance_of?(Episode)
      self.build_season unless season_id
      self.season.build_series unless season.series_id
    end
    if self.instance_of?(Season)
      self.build_series unless series_id
    end
  end
end
