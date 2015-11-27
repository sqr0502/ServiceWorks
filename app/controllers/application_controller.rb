class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include ReviewsHelper
end




services = [ "Kitchen Installation and Repair",'Bathroom Installation and Repair', "Painting Services", "Electrical Services", "HVAC Repair and Installation", "Landscaping Services", "Driveway Installation and Repair",  "Flooring Installation", "Carpentry Services", "Plumbing Services", "Drywall Service", "Power Washing", "Roof Repair", "Fence and Desk Installation and Repair"]

services.each do |s|
  Service.create(name: s)
end
