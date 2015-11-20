json.array!(@service_requests) do |service_request|
  json.extract! service_request, :id, :additional_notes
  json.url service_request_url(service_request, format: :json)
end
