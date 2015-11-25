class ReviewsController < ApplicationController
  # Make sure a user is logged in
  before_action :logged_in?, only: [:create]

  def new
    @review = Review.new
  end

  def create
    # Create a new review
    @review = current_user.reviews.new(review_params)
    # Get the service request being reviewed
    service_request = ServiceRequest.find(params[:service_request_id])
    if @review.save
      # Associated the new review to the service request
      service_request.review = @review

      flash[:sucess] = "Review posted successfully"
      redirect_to user_service_request_path(@review.user_id, service_request.id)
    else
      # The user must select a rating in order to post a review. The comment is not required.
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
    params.require(:review).permit(:rating, :comment, :user_id, :service_request_id, :company_id)
  end
end
