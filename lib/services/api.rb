module  Services
  class Api
    #Api services for making http calls

    #get weather forecast details for the given zip code 
    def get_weather_forecast(zip_code)
      params = {
        key: ENV['API_SECRET_KEY'] || Rails.application.credentials.dig(:api_secret_key),
        q: zip_code
      }
      get(url_for("forecast"), params)
    end

    protected

    #handles get methods for any get calls
    def get(path, params, timeout = 10)
      response = HTTParty.get(path, query: params)
      raise "Response: #{response}" unless response.success?
      response
    end

    def url_for(endpoint)
      "http://api.weatherapi.com/v1/#{endpoint}.json"
    end
  end
end
