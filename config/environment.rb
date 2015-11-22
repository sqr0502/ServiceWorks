# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# SendGrid
ActionMailer::Base.smtp_settings = {
    :user_name => 'modake',
    :password => 'wyncode1',
    :domain => 'www.chrismorse.cn',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}