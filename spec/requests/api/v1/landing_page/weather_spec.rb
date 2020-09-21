require 'rails_helper'

describe "Weather API" do
  it "Returns correct weather details", :vcr do
    get '/api/v1/forecast?location=denver,co'
    data = JSON.parse(response.body)

    expect(data["current"]["sunrise"]).to_not be(nil)
    expect(data["current"]["sunset"]).to_not be(nil)
    expect(data["current"]["temp"]).to_not be(nil)
    expect(data["current"]["feels_like"]).to_not be(nil)
    expect(data["current"]["pressure"]).to_not be(nil)
    expect(data["current"]["humidity"]).to_not be(nil)
    expect(data["current"]["dew_point"]).to_not be(nil)
    expect(data["current"]["uvi"]).to_not be(nil)
    expect(data["current"]["clouds"]).to_not be(nil)
    expect(data["current"]["visibility"]).to_not be(nil)
    expect(data["current"]["wind_speed"]).to_not be(nil)

    expect(data["hourly"]).to_not be(nil)

    expect(data["daily"]).to_not be(nil)

    expect(data["minutely"]).to be(nil)
  end
end
