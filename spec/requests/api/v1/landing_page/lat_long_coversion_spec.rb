require 'rails_helper'

describe "Latittude, Longitude API" do
  it "receives a 200 response" do
    get '/api/v1/forecast?location=denver,co'
    JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it "returns correct lat/long for a correct city" do
    get '/api/v1/forecast?location=denver,co'
    data = JSON.parse(response.body)

    lat = 39.74
    long = -104.98

    expect(data["lat"]).to eq(lat)
    expect(data["lon"]).to eq(long)
  end

  it "when entering an invalid city it defaults to the center of the country" do
    get '/api/v1/forecast?location=dfskjdshfkdhfs,xx'
    data = JSON.parse(response.body)

    lat = 38.43
    long = -96.35

    expect(data["lat"]).to eq(lat)
    expect(data["lon"]).to eq(long)
  end
end
