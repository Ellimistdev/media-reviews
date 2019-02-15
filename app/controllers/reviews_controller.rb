class ReviewsController < ApplicationController
  before_action :set_user, only: %i[index]
  before_action :set_review, only: %i[destroy edit update data]
  before_action :require_login, only: %i[create]
  before_action :require_owner, only: %i[destroy edit update]

  def index
    @reviews = @user.reviews
  end

  def create
    review = Review.new(review_params)
    # If this fails, view already exists
    View.create(viewer: review.reviewer, medium: review.medium)
    if review.save
      render json: review, status: 201
    else
      render json: { errors: review.errors.full_messages }, status: 400
    end
  end

  def edit; end

  def update
    @review.update(review_params)
    return redirect_to edit_review_path(@review), notice: @review.errors unless @review.errors.blank?

    redirect_to medium_path(@review.medium)
  end

  def destroy
    @review.destroy
    if @review.destroyed?
      head :accepted
    else
      head :bad_request
    end
  end

  def data
    render json: @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :medium_id, :user_id)
  end

  def require_owner
    return head(:forbidden) unless current_user == @review&.reviewer
  end

  def set_review
    @review = Review.find_by(id: params[:id])
  end
end
