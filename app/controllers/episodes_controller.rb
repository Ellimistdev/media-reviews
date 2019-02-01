class EpisodesController < ApplicationController
  before_action :set_episode, only: %i[show]

  def new; end

  def create
    episode = Episode.create(episode_params)
    unless episode.errors.blank?
      season = Season.find_by(id: params[:episode][:season_id])
      return redirect_back fallback_location: new_series_season_episode_path(series_id: season.parent.id, season_id: season.id), notice: episode.errors 
    end

    redirect_to episode_path(episode)
  end

  def show; end

  private

  def episode_params
    params.require(:episode).permit(:title, :season_id)
  end

  def set_episode
    id = params[:episode_id] || params[:id]
    @episode = Episode.find_by(id: id)
    return redirect_to new_episode_path unless @episode
  end
end
