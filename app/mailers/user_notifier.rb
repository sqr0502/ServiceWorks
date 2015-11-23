class UserNotifier < ActionMailer::Base
    default :from => 'chris@modake.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app.' )
  end

  def new_quote_notification(user)
    @user = user
    mail( :to => @user.email,
        :subject => 'A new quote has been made for your service request!' )    
  end
    def quote_acceptance_notification(user)
    @user = user
    mail( :to => @user.email,
        :subject => 'Congratulations! Your service quote has been accepted.' )    
  end    
end