class QuotesController < ApplicationController
  # NumberHelper is needed to display the currency in the flash message
  include ActionView::Helpers::NumberHelper
  before_action :set_service_request, only: [:new, :create, :accept_quote]
  after_action :set_status, only: [:destroy]

  def new
    @quote = current_user.quotes.new
  end

  # Uses can accept a company's quote by clicking the "accept" button/link
  def accept_quote
    # When the button is clicked, the params contain the quote ID of the accepted quote
    quote = Quote.find(params[:quote_id][:quote_id])
    # get the company of the accepted quote
    company_name = User.find(quote.user_id).company_name
    # get the amount of the accepted quote. This value is used in the flash message below
    quote_amount = number_to_currency(quote.amount)

    # Update the quote to status "Accepted"
    quote.update(quote_params)
    # Update the quote to status "Accepted"
    @service_request.update(service_request_params)

    # Send email to the company to inform them that the quote has been accepted.
    UserNotifier.new_quote_notification(User.find(quote.user_id)).deliver

    flash[:success] = "You have accepted #{company_name}'s quote for #{quote_amount}"
    redirect_to user_service_request_path(quote.service_request.user_id, quote.service_request.id)
  end

  def create
    @quote = current_user.quotes.new(quote_params)
    # set the quote.user_id to the company ID who created the quote
    @quote.user_id = current_user.id

    # creat an array of user_id value from previous quotes, if any.  This array is used in a check to
    # ensure that companies cannot quote the same service request more than once
    prev_quotes = []
    @service_request.quotes.each do |q|
      prev_quotes << q.user_id
    end

    # Don't let a company add more than one quote per service request
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

        # Send Twilio SMS on signup
          user = User.find(@quote.service_request.user_id)
          quote = "Hi #{user.first_name}, a company has replied to your service request! Log on to the Service Works website to view the details."
          User.send_text_message(user, quote) if user.phone


      else
        flash[:danger] = "An error occurred when submitting quote"
        redirect_to user_service_request_path(@quote.service_request.user_id, @quote.service_request.id)
      end
    end
  end

  def destroy
    # A company can delete a previously created quote as long as it hasn't been accepted
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

  # Set the status ot the service request back to Open if ALL quotes are deleted from a service request
  # The quote delete link sends a status parameter of "Open"
  def set_status
    service_request = ServiceRequest.find(@quote.service_request_id)
    service_request.update(service_request_params) if service_request.quotes.empty?
  end

end
