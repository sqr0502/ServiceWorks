class ChargesController < ApplicationController
    ## See config/initialize/stripe.rb for key information   
    def new
    end

    def create
      # Amount in cents
        
        @amount = (params[:amount].to_i)
        @amount = @amount *= 100

      customer = Stripe::Customer.create(
        :email => params[:user_email],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount * 100,
        :description => 'ffffff',
        :currency    => 'usd'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end