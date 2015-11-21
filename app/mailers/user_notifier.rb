class UserNotifier < ActionMailer::Base
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

  def send_new_quote_notification(user)
    @user = user
    mail( :to => @user.email,
        :subject => 'A new quote has been made for your service request!' )    
  end
end