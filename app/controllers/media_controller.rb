class MediaController < ApplicationController
  before_action :set_medium, only: %i[show]

  def index; end

  def show
    case @medium.medium_type.downcase
    when 'movie'
      redirect_to movie_path(@medium.element)
    when 'series'
      redirect_to series_path(@medium.element)
    when 'season'
      redirect_to season_path(@medium.element)
    when 'episode'
      redirect_to episode_path(@medium.element)
    else
      redirect_back fallback_location: root_path, notice: 'Something has gone terribly wrong'
    end    
  end

  private

  def set_medium
    @medium = Medium.find_by(id: params[:id])
  end
end
