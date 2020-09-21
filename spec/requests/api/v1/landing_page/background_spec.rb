require 'rails_helper'

describe "Image API" do
  it "Returns correct a 200 response", :vcr do
    get '/api/v1/backgrounds?location=denver,co'
    JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it "Returns image of city in search", :vcr do
    get '/api/v1/backgrounds?location=denver,co'
    data = JSON.parse(response.body)

    expect(data[0]["type"]).to eq("photo")

    expect(data[0]["type"]).to_not eq("video")
    expect(data[0]["tags"]).to_not include("dallas")
  end

end
