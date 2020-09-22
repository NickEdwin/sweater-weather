require 'date'

class Forecast
  attr_reader :time,
              :current_temp,
              :feels_like,
              :high_temp,
              :low_temp,
              :sunrise,
              :sunset,
              :humidity,
              :visibility,
              :uv_index,
              :hourly,
              :seven_day_forecast

  def initialize(weather_info)
    @time = time_conversion(weather_info[:current][:dt])
    @current_temp = weather_info[:current][:temp]
    @feels_like = weather_info[:current][:feels_like]
    @high_temp = weather_info[:daily][0][:temp][:max]
    @low_temp = weather_info[:daily][0][:temp][:min]
    @sunrise = time_conversion(weather_info[:daily][0][:sunrise])
    @sunset = time_conversion(weather_info[:daily][0][:sunset])
    @humidity = weather_info[:daily][0][:humidity]
    @visibility = weather_info[:current][:visibility]
    @uv_index = weather_info[:current][:uvi]
    @hourly = weather_info[:hourly]
    @seven_day_forecast = weather_info[:daily]
  end

  def time_conversion(time)
     Time.at(time).strftime('%-I:%M %p, %B %-d')
  end
end
