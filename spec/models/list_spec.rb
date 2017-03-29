require 'rails_helper'

RSpec.describe List, type: :model do

  let(:valid_list) {
    {
      title:   "My list",
      private: false
    }
  }

  let(:valid_user) {
    {
      name: "Tyler Durden",
      email: "tyler@example.com",
      password: "123456"
    }
  }

  def setup
    @user = User.create(valid_user)
  end

  it "is valid with valid attributes" do
    setup
    expect(@user.lists.build(valid_list)).to be_valid
  end

  it "user id should be present" do
    expect(List.new(valid_list)).to be_invalid
  end

  it "title should be present" do
    setup
    expect(@user.lists.build(valid_list.merge(title: " "))).to be_invalid
  end

end
