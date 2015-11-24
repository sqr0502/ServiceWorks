class ReviewsController < ApplicationController
  before_action :logged_in?, only: [:create]

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    service_request = ServiceRequest.find(params[:service_request_id])
    if @review.save
      service_request.review = @review

      flash[:sucess] = "Review posted successfully"
      redirect_to user_service_request_path(@review.user_id, service_request.id)
    else
      flash[:danger] = "Please select a rating"
      redirect_to user_service_request_path(@review.user_id, service_request.id)
    end
  end

  def edit
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :service_request_id)
  end
end
