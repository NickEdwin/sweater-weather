require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  it "can be create a new user" do
    User.create(email: "emailman@gmail.com", password: "password")

    user = User.last
    expect(user.email).to eq("emailman@gmail.com")
  end
end
