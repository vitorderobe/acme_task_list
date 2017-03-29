require 'rails_helper'

RSpec.describe Favorite, type: :model do

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
  	@list = @user.lists.create(valid_list)
  end

  it "is valid with valid attributes" do
  	setup
    expect(Favorite.new(user_id: @user.id, list_id: @list.id)).to be_valid
  end

  it "user id should be present" do
  	setup
    expect(Favorite.new(user_id: nil, list_id: @list.id)).to be_invalid
  end

  it "list id should be present" do
  	setup
    expect(Favorite.new(user_id: @user.id, list_id: nil)).to be_invalid
  end

end
