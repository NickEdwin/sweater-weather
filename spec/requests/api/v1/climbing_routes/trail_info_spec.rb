require 'rails_helper'

describe "Climbing API" do
  it "receives a 200 response", :vcr do
    get '/api/v1/climbing_routes?location=denver,co'
    JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it "returns proper json data", :vcr do
    get '/api/v1/climbing_routes?location=denver,co'
    results = JSON.parse(response.body)
    
    expect(results["type"]).to eq("climbing_route")
    expect(results["attributes"]["location"]).to eq("denver,co")
    expect(results["attributes"]["forecast"]["summary"]).to eq("clear sky")
    expect(results["attributes"]["forecast"]["temperature"]).to eq(72.77)
  end
end
