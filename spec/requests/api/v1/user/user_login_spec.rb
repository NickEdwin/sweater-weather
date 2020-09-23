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
        expect(data["data"]["attributes"]["email"]).to eq("email1@gmail.com")
        expect(data["data"]["attributes"]["api_key"]).to eq("api")
        expect(session[:user_id]).to eq(@user.id)
      end

      context "with invalid email" do
        User.create(email: "email1@gmail.com", password: "password1", api_key: "api")
        let(:invalid_email_params) do
          {
            email: "",
            password: "password1",
            api_key: "api"
          }
        end

        it "can log in an existing user with bad params" do
          post "/api/v1/sessions", params: invalid_email_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(400)
          expect(data["data"]["errors"]).to eq("Invalid credentials")
        end
      end

      context "with invalid password" do
        User.create(email: "email1@gmail.com", password: "password1", api_key: "api")
        let(:invalid_password_params) do
          {
            email: "email1@gmail.com",
            password: "",
            api_key: "api"
          }
        end

        it "can log in an existing user with bad params" do
          post "/api/v1/sessions", params: invalid_password_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(400)
          expect(data["data"]["errors"]).to eq("Invalid password")
        end
      end
    end
  end
end
