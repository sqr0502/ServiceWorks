class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.first_name}! Your account has been succesfully created."

      redirect_to user_service_requests_path(@user)

      # Send email to the user after the user signs up
      UserNotifier.send_signup_email(@user).deliver
    else
      render :action => 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :street_one, :street_two,
                                 :state, :zip, :phone, :is_provider, :company_name,
                                 :company_desc, :business_logo, :city)
  end
end
