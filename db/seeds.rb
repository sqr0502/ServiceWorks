Service.create!([
  {name: "Kitchen Installation and Repair"},
  {name: "Bathroom Installation and Repair"},
  {name: "Painting Services"},
  {name: "Electrical Services"},
  {name: "HVAC Repair and Installation"},
  {name: "Landscaping Services"},
  {name: "Driveway Installation and Repair"},
  {name: "Flooring Installation"},
  {name: "Carpentry Services"},
  {name: "Plumbing Services"},
  {name: "Drywall Service"},
  {name: "Power Washing"},
  {name: "Roof Repair"},
  {name: "Fence and Desk Installation and Repair"},
  {name: "Kitchen Installation and Repair"},
  {name: "Bathroom Installation and Repair"},
  {name: "Painting Services"},
  {name: "Electrical Services"},
  {name: "HVAC Repair and Installation"},
  {name: "Landscaping Services"},
  {name: "Driveway Installation and Repair"},
  {name: "Flooring Installation"},
  {name: "Carpentry Services"},
  {name: "Plumbing Services"},
  {name: "Drywall Service"},
  {name: "Power Washing"},
  {name: "Roof Repair"},
  {name: "Fence and Desk Installation and Repair"}
])
User.create!([
  {first_name: "Alex", last_name: "Miller", email: "apmiller108@yahoo.com", password_digest: "$2a$10$BaiOgug3ZE6f.zv4rOARE.QrtHsTmORwTp4A9CLvPeD6jL4/zUoLK", street_one: "10781 Cleary Blvd Apt 306", street_two: "", state: "FL", zip: "33324", phone: "319-621-1065", is_provider: false, company_name: "", company_desc: "", business_logo: nil, latitude: 26.134199, longitude: -80.291293, city: nil},
  {first_name: "Jane", last_name: "Doe", email: "company1@example.com", password_digest: "$2a$10$pnWLmrHPJfeljx.PG.eTPO1xGxmD1skErtIIT7fXQyO7yczjdk7mO", street_one: "525 NW 1st Ave", street_two: "", state: "FL", zip: "33301", phone: "555-555-5555", is_provider: true, company_name: "Handyman Repair Co.", company_desc: "Handyman Repair Company offers a wide range of home repairs, maintenance services, and remodeling projects. We can meet any need you may have for your house or commercial buildings. From carpentry to room remodels, we have you covered with quality work you can count on. With The Handyman Company, you can trust that we’ll put as much care into your home as you do.", business_logo: open("db/seedimages/handyman_repair.jpg"), latitude: 26.1288072, longitude: -80.1449695, city: nil},
  {first_name: "John", last_name: "Doe", email: "company2@example.com", password_digest: "$2a$10$yDhh9jU8idYo6e1Qtr8iueSIxMfGI.dc58QgC7T3g0hKDYapcBuk.", street_one: "150 S Pine Island Rd", street_two: "", state: "FL", zip: "33324", phone: "555-555-5555", is_provider: true, company_name: "ProMaster", company_desc: "Homeowners rarely buy property that they love exactly as is. Whether you need more room for a growing family, or you want to make a strategic investment in your most valuable asset before it comes time to sell, ProMaster can get the job done right.", business_logo: open("db/seedimages/promaster_logo-1200x733.jpg"), latitude: 26.1184137, longitude: -80.2623676, city: nil},
  {first_name: "Jack", last_name: "Hill", email: "company3@example.com", password_digest: "$2a$10$sxfR5QcjkrQZmg67L7oCF.GrqV6el2.29//K9qiyDKzBuSlRst30W", street_one: "2829 N Federal Hwy", street_two: "", state: "FL", zip: "33306", phone: "555-555-5555", is_provider: true, company_name: "Comfort Crew", company_desc: "When you want the best in HVAC, count on Comfort Crew. Family and locally owned, our mission is to serve our community with pride and dedication. Our commitment to quality and outstanding service will earn your trust. Call us today when you want the best!", business_logo: open("db/seedimages/retro-logo-design-hvac-299x299.jpg"), latitude: 26.1626399, longitude: -80.1169462, city: nil},
  {first_name: "Grace", last_name: "Hopper", email: "customer1@example.com", password_digest: "$2a$10$3yyiyTfWKw0/2Ti1pQmO8e7Y3acOVbhjcFM.wap.MglqJcfP/N51O", street_one: "10155 W Oakland Park Blvd ", street_two: "", state: "FL", zip: "33351", phone: "555-555-5555", is_provider: false, company_name: "", company_desc: "", business_logo: nil, latitude: 26.1708641, longitude: -80.2867376, city: nil},
  {first_name: "Dan", last_name: "Patrick", email: "customer2@example.com", password_digest: "$2a$10$YUT7gBYb5Sfk7NrFHaDBBuXaLf9sITKOCZmwplO9zytRulOzFUm..", street_one: "3102 Griffin Rd", street_two: "", state: "FL", zip: "33312", phone: "555-555-5555", is_provider: false, company_name: "", company_desc: "", business_logo: nil, latitude: 26.0615373, longitude: -80.1849859, city: nil},
  {first_name: "Pat", last_name: "Benetar", email: "customer3@example.com", password_digest: "$2a$10$kezd3R7L8boF7Uq4Mih2FOQn/LRTG5xJBzJNU9G7TCEF0HLZJHvGi", street_one: "4567 Weston Rd ", street_two: "", state: "FL", zip: "33331", phone: "555-555-5555", is_provider: false, company_name: "", company_desc: "", business_logo: nil, latitude: 26.0635464, longitude: -80.3629657, city: nil}
])
ServiceRequest.create!([
  {additional_notes: "I need a power washing estimate.  There are oil stains on my driveway that I need removed.", user_id: 1, users_id: nil, status: "Open", image: [open("db/seedimages/dirty-driveway.jpg")], order_number: 3265},
  {additional_notes: "Last night's storm damaged my roof.  I need an estimate to repair it.  Trust fund migas pop-up austin slow-carb lomo. Pop-up small batch ugh, iPhone helvetica blog put a bird on it raw denim tacos kickstarter skateboard marfa freegan echo park. ", user_id: 5, users_id: nil, status: "Open", image: [open("db/seedimages/roof-damage.jpg")], order_number: 67010},
  {additional_notes: "I have an old, dirty bathtub that needs to be resurfaced.  ", user_id: 6, users_id: nil, status: "Open", image: [open("db/seedimages/dirty-bathtub.jpg")], order_number: 68511},
  {additional_notes: "Due to water damage, a section of drywall is damaged.  I need this fixed ASAP!", user_id: 7, users_id: nil, status: "Quoted", image: [open("db/seedimages/Water-Damaged-Ceiling-photo.jpg")], order_number: 2579}
])
ServiceRequestService.create!([
  {service_request_id: 1, service_id: 7},
  {service_request_id: 2, service_id: 13},
  {service_request_id: 3, service_id: 2},
  {service_request_id: 4, service_id: 11}
])
Quote.create!([
  {amount: "315.0", note: "All our work is backed by a 90 day warranty.", service_request_id: 4, user_id: 2, status: nil},
  {amount: "304.99", note: "We are licensed and bonded. ", service_request_id: 4, user_id: 3, status: nil},
  {amount: "385.0", note: "Your satisfaction is guaranteed.", service_request_id: 4, user_id: 4, status: nil}
])
