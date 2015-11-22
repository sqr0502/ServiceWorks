# Project Breakdown

MODELS - complete
1. Users - Complete
2. Login Logout - Complete
3. ServiceRequest Model - complete
4. Service Model - complete
5. Quote Model - complete
6. Users create and have service_requests - complete
7. service_requests has_many services/service belongs_to service_request - complete
8. service_request has_many quotes - complete
9. quote belongs_to service_request - complete
10. quote belongs to user -complete
11. user has_many quotes -complete

FUNCTIONALITY

1. Users create service_requests with services needed - complete
2. Business respond to service_request with quotes
3. Users can accept quotes - complete
4. Users can schedule service appointment
5. Users can pay for service (reach goal)
6. Users get notified with a business has quoted one of their service_requests
  a. Twilio (text message)
  b. Sendgrid (email) - complete

FRONT END

1. Materialize framework - complete
2. ServiceWorks app name
3. Add company logo - complete
4. Create and style home page
5. Style the signup form
6. Style the profile page

GEMS

1. Carrierwave - complete
2. RMagic (Req ImageMagic, do brew install) - complete
3. Fog (for S3) - complete
4. Stripe - Done

## Feature Timeline
Wednesday - MVP
Sunday - Final
Monday - Presentation Draft


## TODO
- Add number of transactions marked as paid to user and servicer profile page.
- Clicking 'signup' launches signup form in a bootstrap modal window.


## Stretch Goals
- Reviews for users and servicer.
- On order form, user drops pin on map for address.
- Recurring payments for monthly arrangements.

## Notes
Syntax for sending emails:
UserNotifier.send_signup_email(@user).deliver
      redirect_to(@user)  
      
Email template is located at app/views/user_notifier/send_signup_email.html.erb