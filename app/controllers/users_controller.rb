class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.first_name}! Your account has been succesfully created."

      redirect_to user_service_requests_path(@user)

      # Send email to the user after the user signs up
      UserNotifier.send_signup_email(@user).deliver


      # Send Twilio SMS to the user after signup
      signup = "Thanks for signing up for Service Works, #{@user.first_name}!"
      User.send_text_message(@user, signup) if params[:phone]
    else
      render :action => 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Your profile has been successfully update"
      redirect_to @user
    else
      render "show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :street_one, :street_two,
                                 :state, :zip, :phone, :is_provider, :company_name,
                                 :company_desc, :business_logo, :city, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
