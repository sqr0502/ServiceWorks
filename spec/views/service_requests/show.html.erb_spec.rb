require 'rails_helper'

RSpec.describe "service_requests/show", type: :view do
  before(:each) do
    @service_request = assign(:service_request, ServiceRequest.create!(
      :additional_notes => "Additional Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Additional Notes/)
  end
end
