json.array!(@service_requests) do |service_request|
  json.extract! service_request, :created_at, :id, :additional_notes, :status, :quotes,  :services, :updated_at
  #when removing this we get the json object returned for its route
  # json.url service_request_url(service_request, format: :json)
end
