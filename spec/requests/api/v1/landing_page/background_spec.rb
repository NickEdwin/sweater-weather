require 'rails_helper'

describe "Image API" do
  it "Returns correct a 200 response", :vcr do
    get '/api/v1/backgrounds?location=denver,co'
    JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
