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
    
    expect(data["data"]["type"]).to eq("background")
    expect(data["data"]["type"]).to_not eq("video")

    expect(data["data"]["attributes"]["image"]["tags"]).to include("city")
    expect(data["data"]["attributes"]["image"]["pixabay_site"]).to eq("Pixabay.com")
    expect(data["data"]["attributes"]["image"]["author"]).to eq("AveCalvar")
  end
end
