class ViewsController < ApplicationController
  before_action :set_user, only: %i[index]
  before_action :require_login, only: %i[create]
  before_action only: %i[destroy] do
    set_view
    require_owner
  end

  def index
    @views = @user.views
  end

  def create
    view = View.new(view_params)
    view.save
    redirect_to medium_path(view.medium)
  end

  def destroy
    @view.destroy
    redirect_back fallback_location: root_path
  end

  private

  def view_params
    params.require(:view).permit(:medium_id, :user_id)
  end

  def require_owner
    return head(:forbidden) unless current_user == @view.viewer
  end

  def set_view
    @view = View.find_by(id: params[:id])
  end
end
