class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show]
  before_action :filter, only: %i[index]

  def index; end

  def new; end

  def create
    movie = Movie.create(movie_params)
    return redirect_back fallback_location: new_movie_path, notice: movie.errors unless movie.errors.blank?

    redirect_to movie_path(movie)
  end

  def show; end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end

  def filter    
    @movies = params[:filter] ? Movie.where('title like ?', "%#{params[:filter]}%" ) : Movie.all
  end

  def set_movie
    @movie = Movie.find_by(id: params[:id])
    return redirect_to new_movie_path unless @movie
  end
end
