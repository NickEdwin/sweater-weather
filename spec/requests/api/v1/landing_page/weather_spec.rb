require 'rails_helper'

describe "Weather API" do
  it "Returns correct weather details", :vcr do
    get '/api/v1/forecast?location=denver,co'
    data = JSON.parse(response.body)

    expect(data["data"]["attributes"]["forecast"]["sunrise"]).to_not be(nil)
    expect(data["data"]["attributes"]["forecast"]["sunset"]).to_not be(nil)
    expect(data["data"]["attributes"]["forecast"]["current_temp"]).to_not be(nil)
    expect(data["data"]["attributes"]["forecast"]["high_temp"]).to_not be(nil)
    expect(data["data"]["attributes"]["forecast"]["low_temp"]).to_not be(nil)
    expect(data["data"]["attributes"]["forecast"]["feels_like"]).to_not be(nil)
    expect(data["data"]["attributes"]["forecast"]["humidity"]).to_not be(nil)
    expect(data["data"]["attributes"]["forecast"]["uv_index"]).to_not be(nil)
    expect(data["data"]["attributes"]["forecast"]["visibility"]).to_not be(nil)

    expect(data["data"]["attributes"]["forecast"]["seven_day_forecast"]).to_not be(nil)

    expect(data["data"]["attributes"]["forecast"]["hourly"]).to_not be(nil)

    expect(data["data"]["attributes"]["forecast"]["minutely"]).to be(nil)
  end

  it "Returns correct weather details", :vcr do
    get '/api/v1/forecast?location=denver,co'
    data = JSON.parse(response.body)

    expect(data["data"]["attributes"]["forecast"]["current_temp"]).to be(84.07)
    expect(data["data"]["attributes"]["forecast"]["high_temp"]).to be(84.94)
    expect(data["data"]["attributes"]["forecast"]["low_temp"]).to be(65.21)
    expect(data["data"]["attributes"]["forecast"]["feels_like"]).to be(74.23)
    expect(data["data"]["attributes"]["forecast"]["humidity"]).to be(16)
    expect(data["data"]["attributes"]["forecast"]["uv_index"]).to be(6.87)
    expect(data["data"]["attributes"]["forecast"]["visibility"]).to be(10000)
  end
end
