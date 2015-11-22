class QuotesController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_service_request, only: [:new, :create, :accept_quote]

  def new
    @quote = current_user.quotes.new
  end

  def accept_quote
    quote = Quote.find(params[:quote_id][:quote_id])
    company_name = User.find(quote.user_id).company_name
    quote_amount = number_to_currency(quote.amount)

    quote.update(quote_params)
    @service_request.update(service_request_params)

    flash[:success] = "You have accepted #{company_name}'s quote for #{quote_amount}"
    redirect_to user_service_request_path(quote.service_request.user_id, quote.service_request.id)
  end

  def create
    @quote = current_user.quotes.new(quote_params)
    @quote.user_id = current_user.id

    # creat an array of user_id value from previous quotes, if any.  This array is used in a check to
    # ensure that companies cannot quote the same service request more than once
    prev_quotes = []
    @service_request.quotes.each do |q|
      prev_quotes << q.user_id
    end


    if prev_quotes.include? current_user.id
      flash[:danger] = "You can only submit one quote per service request"
      redirect_to user_service_request_path(@quote.service_request.user_id, @quote.service_request.id)
    else
      if @quote.save
        @service_request.update(service_request_params)
        flash[:success] = "Your quote was sucessfully submitted"

        #email user when a quote is submitted
        UserNotifier.new_quote_notification(User.find(@quote.service_request.user_id)).deliver
        redirect_to user_service_request_path(@quote.service_request.user_id, @quote.service_request.id)
      else
        flash[:danger] = "An error occurred when submitting quote"
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
    params.require(:quote).permit(:amount, :note, :service_request_id, :user_id, :status)
  end

  def service_request_params
    params.require(:service_request).permit(:additional_notes, :user_id, :status)
  end

end
