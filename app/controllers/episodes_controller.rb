class EpisodesController < ApplicationController
  before_action :set_episode, only: %i[show]

  def index
    @episodes = Episode.in_season(params[:season_id])
  end

  def new; end

  def create
    episode = Episode.create(episode_params)
    return redirect_back fallback_location: new_episode_path, notice: episode.errors unless episode.errors.blank?

    redirect_to episode_path(episode)
  end

  def show; end

  private

  def episode_params
    params.require(:episode).permit(:number, :season_id)
  end

  def set_episode
    id = params[:episode_id] || params[:id]
    @episode = Episode.find_by(id: id)
    return redirect_to new_episode_path unless @episode
  end
end
