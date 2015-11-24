class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:sucess] = "Review posted successfully"
      redirect_to user_service_request.path(@review.user_id, @review.service_request_id)
    end
  end

  def edit
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
