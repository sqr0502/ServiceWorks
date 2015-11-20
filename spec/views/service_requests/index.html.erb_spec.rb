require 'rails_helper'

RSpec.describe "service_requests/index", type: :view do
  before(:each) do
    assign(:service_requests, [
      ServiceRequest.create!(
        :additional_notes => "Additional Notes"
      ),
      ServiceRequest.create!(
        :additional_notes => "Additional Notes"
      )
    ])
  end

  it "renders a list of service_requests" do
    render
    assert_select "tr>td", :text => "Additional Notes".to_s, :count => 2
  end
end
