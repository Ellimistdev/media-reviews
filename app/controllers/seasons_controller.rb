class SeasonsController < ApplicationController
  before_action :set_season, only: %i[show]

  def new
    @season = Season.new
    @season.episodes.build
  end

  def create
    season = Season.new(season_params)    
    series = Series.find_by(id: params[:season][:series_id]) 
    season.series = series
    season.save
    return redirect_back fallback_location: new_series_season_path(params[:season][:series_id]), notice: season.errors unless season.errors.blank?

    redirect_to season_path(season)
  end

  def show; end

  private

  def season_params
    params.require(:season).permit(:number, episodes_attributes: [:title])
  end

  def set_season
    id = params[:season_id] || params[:id]
    @season = Season.find_by(id: id)
    return redirect_to new_season_path unless @season
  end
end
