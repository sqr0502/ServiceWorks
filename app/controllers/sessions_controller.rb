class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log in the user after successful signup
      log_in user
      # Redirect to user page on login.
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'Succesfully logged out!'
    redirect_to root_url
  end
  
end
