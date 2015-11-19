# Project Breakdown

MODELS
1. Users - Complete
2. Login Logout - Complete
3. ServiceRequest Model
4. Service Model
5. Quote Model
6. Users create and have service_requests
7. service_requests has_many services/service belongs_to service_request
8. service_request has_many quotes
9. quote belongs_to service_request
10. quote belongs to user
11. user has_many quotes

FUNCTIONALITY

1. Users create service_requests with services needed
2. Business respond to service_request with quotes
3. Users can accept quotes
4. Users can schedule service appointment
5. Users can pay for service (reach goal)
6. Users get notified with a business has quoted one of their service_requests
  a. Twilio (text message)
  b. Sendgrid (email)

FRONT END

1. Materialize framework
2. ServiceWorks app name
3. Add company Logo
4. Create and style home page
5. Style the signup form
6. Style the profile page.


## Feature Timeline


## TODO
- Add number of transactions marked as paid to user and servicer profile page.
-

## Stretch Goals
- Reviews for users and servicer.
- On order form, user drops pin on map for address.
