class QuotesController < ApplicationController
  before_action :set_service_request, only: [:new, :create]

  def new
    @quote = current_user.quotes.new
  end

  def create
    @quote = current_user.quotes.new(quote_params)
    @quote.user_id = current_user.id
    
    prev_quotes = []

    @service_request.quotes.each do |q|
      prev_quotes << q.user_id
    end

    if prev_quotes.include? current_user.id
      flash[:danger] = "You can submit one quote per service request"
      redirect_to user_service_request_path(@quote.service_request.user_id, @quote.service_request.id)
    else
      if @quote.save
        flash[:sucess] = "Quote sucessfully submitted"
        redirect_to user_service_request_path(@quote.service_request.user_id, @quote.service_request.id)
      else
        flash[:danger] = "Error occurred when submitting quote"
        redirect_to user_service_request_path(@quote.service_request.user_id, @quote.service_request.id)
      end
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    if current_user.id == @quote.user_id
      @quote.destroy
      flash[:success] = "Your quote was successfully deleted"
      redirect_to user_service_request_path(@quote.service_request.user_id, @quote.service_request.id)
    else
      flass[:danger] = "This action is not authorized"
      redirect_to user_service_requests_path(current_user)
    end
  end

  private

  def set_service_request
    @service_request = ServiceRequest.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:amount, :note, :service_request_id, :user_id)
  end


end
