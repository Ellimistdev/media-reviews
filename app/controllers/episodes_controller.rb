class EpisodesController < ApplicationController
  before_action :set_episode, only: %i[show data]

  def new; end

  def create
    episode = Episode.new(episode_params)
    season = Season.find_by(id: params[:episode][:season_id])
    episode.season = season
    episode.save
    unless episode.errors.blank?
      return redirect_back fallback_location: season_path(params[:episode][:season_id]), notice: episode.errors 
    end

    redirect_to episode_path(episode)
  end

  def show; end

  def data
    render json: @episode
  end

  private

  def episode_params
    params.require(:episode).permit(:title)
  end

  def set_episode
    id = params[:episode_id] || params[:id]
    @episode = Episode.find_by(id: id)
    return redirect_to new_episode_path unless @episode
  end
end
