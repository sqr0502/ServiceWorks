class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log in the user after successful signup
      log_in user
      # Redirect to dashboard on login.
      redirect_to "/users/#{user[:id]}/service_requests"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # call log_out method in the SessionHelper
    log_out
    # flash[:success] = 'Succesfully logged out!'
    redirect_to root_url
  end

end
