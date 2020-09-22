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

  it "Returns correct weather details", :vcr do
    get '/api/v1/forecast?location=denver,co'
    data = JSON.parse(response.body)
    
    expect(data["current"]["sunrise"]).to be(1600692427)
    expect(data["current"]["sunset"]).to be(1600736311)
    expect(data["current"]["temp"]).to be(84.07)
    expect(data["current"]["feels_like"]).to be(74.23)
    expect(data["current"]["pressure"]).to be(1023)
    expect(data["current"]["humidity"]).to be(16)
    expect(data["current"]["dew_point"]).to be(33.1)
    expect(data["current"]["uvi"]).to be(6.87)
    expect(data["current"]["clouds"]).to be(40)
    expect(data["current"]["visibility"]).to be(10000)
    expect(data["current"]["wind_speed"]).to be(11.41)
  end
end
