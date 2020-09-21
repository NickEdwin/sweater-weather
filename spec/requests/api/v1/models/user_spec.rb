require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :api_key }
    it { should validate_uniqueness_of :api_key }

  end

  it "can be create a new user" do
    User.create(email: "emailman@gmail.com", password: "password", api_key: "1234")

    user = User.last
    expect(user.email).to eq("emailman@gmail.com")
  end
end
