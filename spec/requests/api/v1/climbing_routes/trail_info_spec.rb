require 'rails_helper'

describe "Climbing API" do
  it "receives a 200 response", :vcr do
    get '/api/v1/climbing_routes?location=denver,co'
    JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
