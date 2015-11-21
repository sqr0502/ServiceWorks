class QuotesController < ApplicationController
  before_action :set_service_request, only: [:new, :create]

  def new
    @quote = current_user.quotes.new
  end

  def create
    @quote = current_user.quotes.new(quote_params)
  end

  private

  def set_service_request
    @service_request = ServiceRequest.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:amount, :note, :service_request_id, :user_id)
  end


end
