require 'rails_helper'

RSpec.describe "service_requests/new", type: :view do
  before(:each) do
    assign(:service_request, ServiceRequest.new(
      :additional_notes => "MyString"
    ))
  end

  it "renders new service_request form" do
    render

    assert_select "form[action=?][method=?]", service_requests_path, "post" do

      assert_select "input#service_request_additional_notes[name=?]", "service_request[additional_notes]"
    end
  end
end
