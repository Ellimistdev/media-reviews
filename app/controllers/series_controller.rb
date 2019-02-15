class SeriesController < ApplicationController
  before_action :set_series, only: %i[show data]

  def index
    @series = Series.all
  end

  def new; end

  def create
    series = Series.create(series_params)
    return redirect_back fallback_location: new_series_path, notice: series.errors unless series.errors.blank?

    redirect_to series_path(series)
  end

  def show; end

  def data
    render json: @series
  end

  def collection
    render json: Series.all, each_serializer: SeriesCollectionSerializer
  end

  private

  def series_params
    params.require(:series).permit(:title)
  end

  def set_series
    @series = Series.find_by(id: params[:id])
    return redirect_to new_series_path unless @series
  end
end
