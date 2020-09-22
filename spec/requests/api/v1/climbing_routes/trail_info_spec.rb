require 'rails_helper'

describe "Climbing API" do
  before(:each) do
    get '/api/v1/climbing_routes?location=denver,co'
    @results = JSON.parse(response.body)
  end

  it "receives a 200 response", :vcr do
    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it "returns proper json data", :vcr do
    expect(@results["data"]["type"]).to eq("climbing_route")
    expect(@results["data"]["attributes"]["location"]).to eq("denver,co")
    expect(@results["data"]["attributes"]["forecast"]["summary"]).to eq("broken clouds")
    expect(@results["data"]["attributes"]["forecast"]["temperature"]).to eq(63.64)
  end

  it "returns proper information on climbing routes", :vcr do
    expect(@results["data"]["attributes"]["routes"].first["name"]).to eq("Dihedral Problem")
    expect(@results["data"]["attributes"]["routes"].first["type"]).to eq("Boulder")
    expect(@results["data"]["attributes"]["routes"].first["rating"]).to eq("V2")
    expect(@results["data"]["attributes"]["routes"].first["location"]).to include("Colorado")
    expect(@results["data"]["attributes"]["routes"].first["distance_to_route"]).to eq(0.02)
  end
end
