require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    User.destroy_all
  end
  describe "model attributes" do
    it "should respond to required attributes methods" do
      user=User.new
      expect(user).to respond_to(:firstname)
      expect(user).to respond_to(:lastname)
      expect(user).to respond_to(:username)
      expect(user).to respond_to(:email)
      expect(user).to respond_to(:password)
    end
    it "should allow creation of model object" do
      user=User.new(firstname: "test", lastname: "test", username: "test", email: "test", password: "test")
      expect(user.save).to be true
      expect(User.all.count).to eq(1)
    end
  end
end
