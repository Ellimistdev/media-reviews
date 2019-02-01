class SeasonsController < ApplicationController
  before_action :set_season, only: %i[show]

  def new; end

  def create
    season = Season.create(season_params)    
    return redirect_back fallback_location: new_series_season_path(params[:season][:series_id]), notice: season.errors unless season.errors.blank?

    redirect_to season_path(season)
  end

  def show; end

  private

  def season_params
    params.require(:season).permit(:number, :series_id)
  end

  def set_season
    id = params[:season_id] || params[:id]
    @season = Season.find_by(id: id)
    return redirect_to new_season_path unless @season
  end
end
