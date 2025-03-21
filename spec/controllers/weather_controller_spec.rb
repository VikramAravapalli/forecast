require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe "GET #show" do
    context "when zip_code is present" do
      let!(:zip_code) { "98018" }
      let!(:forecast) { { current_temperature: 20, high_temperature: 25, low_temperature: 15 } }

      before do
        allow(controller).to receive(:fetch_forecast).and_return(forecast)
      end

      it "assigns @forecast" do
        get :show, params: { zip_code: zip_code }
        expect(assigns(@forecast)).not_to be_nil
      end

      it "writes forecast to cache if not present" do
        get :show, params: { zip_code: zip_code }
        expect(Rails.cache).to receive(:write).with("weather_forecast_#{zip_code}", forecast)
      end
    end

    context "when zip_code is not present" do
      it "does not assign @location" do
        expect { get :show }.to raise_error
      end

      it "does not assign @forecast" do
        get :show
        expect(assigns(:forecast)).to be_nil
      end
    end

    context "when zip_code is invalid" do
      let(:zip_code) { 1231231 }

      it "sets a flash alert" do
        get :show, params: { zip_code: zip_code }
        expect(assigns(:errors)).not_to be_nil
      end
    end
  end
end