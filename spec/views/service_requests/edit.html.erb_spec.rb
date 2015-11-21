require 'rails_helper'

RSpec.describe "service_requests/edit", type: :view do
  before(:each) do
    @service_request = assign(:service_request, ServiceRequest.create!(
      :additional_notes => "MyString"
    ))
  end

  it "renders the edit service_request form" do
    render

    assert_select "form[action=?][method=?]", service_request_path(@service_request), "post" do

      assert_select "input#service_request_additional_notes[name=?]", "service_request[additional_notes]"
    end
  end
end
