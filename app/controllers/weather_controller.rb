class WeatherController < ApplicationController

  def show
    begin
      if params[:zip_code].present?
        zip_code = params[:zip_code]
        #check cache value
        cache_key = "weather_forecast_#{zip_code}"
        @from_cache = @forecast = Rails.cache.read(cache_key)
          
        unless @forecast
          #fetch forecast for zipcode
          @forecast = fetch_forecast(zip_code)
          Rails.cache.write(cache_key, @forecast, expires_in: 30.minutes)
        end
      end
      render :show, status: :ok
    rescue => e
       @errors = e
    end
    
  end

  private

  def fetch_forecast(zip_code)
    #Api call to fetch weather forecast
    response = Services::Api.new.get_weather_forecast(zip_code)
    forecast = response.parsed_response["forecast"]["forecastday"].first["day"]
    {
      current_temperature: forecast["avgtemp_c"],
      high_temperature: forecast["maxtemp_c"],
      low_temperature: forecast["mintemp_c"]
    }
  end
end