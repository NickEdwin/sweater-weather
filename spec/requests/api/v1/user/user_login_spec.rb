require 'rails_helper'

describe "API V1 Users", type: 'request' do
  describe "POST /api/v1/sessions" do
    context "with valid parameters" do
      User.create(email: "email1@gmail.com", password: "password1", api_key: "api")
      let(:valid_params) do
        {
          email: "email1@gmail.com",
          password: "password1",
          api_key: "api"
        }
      end

      it "logs in an existing user" do
        post "/api/v1/sessions", params: valid_params
        expect(response).to be_successful
        expect(response.status).to eq(200)
        data = JSON.parse(response.body)

        @user = User.last

        expect(data["data"]["attributes"]["email"]).to eq(@user.email)
        expect(data["data"]["attributes"]["api_key"]).to eq(@user.api_key)
      end

      context "with invalid parameters" do
        User.create(email: "email1@gmail.com", password: "password1", api_key: "api")
        let(:invalid_params) do
          {
            email: "",
            password: "password1",
            api_key: "api"
          }
        end

        it "can log in an existing user with bad params" do
          post "/api/v1/sessions", params: invalid_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(400)
          expect(data["data"]["errors"]).to eq("Invalid credentials")
        end
      end
    end
  end
end
