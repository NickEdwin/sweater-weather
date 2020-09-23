require 'rails_helper'

describe "API V1 Road Trip", type: 'request' do
  describe "POST /api/v1/road_trip" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          origin: "Denver,CO",
          destination: "Keystone,CO",
          api_key: "api"
        }
      end

      it "receives a 200 response", :vcr do
        User.create(email: "emailz@gmail.com", password: "password1", api_key: "api")
        post "/api/v1/road_trip", params: valid_params

        expect(response).to be_successful
        expect(response.status).to eq(200)
      end

      it "returns the correct information", :vcr do
        User.create(email: "emailzz@gmail.com", password: "password1", api_key: "api")
        post "/api/v1/road_trip", params: valid_params
        data = JSON.parse(response.body)

        expect(data["data"]["type"]).to eq("trip")
        expect(data["data"]["attributes"]["trip"]["origin"]).to eq("Denver,CO")
        expect(data["data"]["attributes"]["trip"]["destination"]).to eq("Keystone,CO")
        expect(data["data"]["attributes"]["trip"]["travel_time"]).to eq(90)
        expect(data["data"]["attributes"]["trip"]["arrival_temp"]).to eq(67.01)
        expect(data["data"]["attributes"]["trip"]["arrival_description"]).to eq("overcast clouds")
      end

      context "with invalid parameters" do
        User.create(email: "email1@gmail.com", password: "password1", api_key: "api")
        let(:invalid_params) do
          {
            origin: "Denver,CO",
            destination: "Keystone,CO",
            api_key: ""
          }
        end

        it "receives a 401 response", :vcr do
          User.create(email: "email1@gmail.com", password: "password1", api_key: "api")
          post "/api/v1/road_trip", params: invalid_params
          expect(response.status).to eq(401)
        end
      end
    end
  end
end
