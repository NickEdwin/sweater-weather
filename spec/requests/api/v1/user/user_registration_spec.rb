require 'rails_helper'

describe "API V1 Users", type: 'request' do
  describe "POST /api/v1/users" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          email: "email1234@gmail.com",
          password: "password1",
          password_confirmation: "password1"
        }
      end

      it "creates a new user" do
        post "/api/v1/users", params: valid_params
        expect(response).to be_successful
        expect(response.status).to eq(201)
      end

      it "creates a user with the correct attributes" do
        post "/api/v1/users", params: valid_params

        @user = User.last
        expect(@user.email).to eq("email1234@gmail.com")
      end

      context "with valid invalid parameters" do
        let(:invalid_email_params) do
          {
            email: "email1",
            password: "password1"
          }
        end

        it "creates a new user" do
          post "/api/v1/users", params: invalid_email_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(400)
          expect(data["data"]["errors"][0]).to eq("Email is invalid")
        end

        let(:invalid_password_params) do
          {
            email: "email1111@email.com",
            password: ""
          }
        end

        it "creates a new user" do
          post "/api/v1/users", params: invalid_password_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(400)
          expect(data["data"]["errors"][0]).to eq("Password can't be blank")
        end
      end
    end
  end
end
