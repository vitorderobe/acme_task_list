require 'rails_helper'

RSpec.describe User, type: :model do

  let(:valid_users) {[
    {
      name: "Tyler Durden",
      email: "tyler@example.com",
      password: "123456"
    },
    {
      name: "Jack",
      email: "jack@example.com",
      password: "123456"
    }
  ]}

  it "is valid with valid attributes" do
    expect(User.new(valid_users.first)).to be_valid
  end

  it "is not valid without name" do
    expect(User.new(valid_users.first.merge(name: " "))).to be_invalid
  end

  it "is not valid without email" do
    expect(User.new(valid_users.first.merge(email: " "))).to be_invalid
  end

  it "is not valid without password" do
    expect(User.new(valid_users.first.merge(password: " "))).to be_invalid
  end

  it "is not valid with a name that is too long" do
    expect(User.new(valid_users.first.merge(name: "a" * 91))).to be_invalid
  end

  it "is not valid with a email that is too long" do
    expect(User.new(valid_users.first.merge(email: "a" * 244 + "@example.com"))).to be_invalid
  end

  it "is not valid with a password that has less than 6 chars" do
    expect(User.new(valid_users.first.merge(password: "a" * 5))).to be_invalid
  end

  it "is not valid with an invalid email address" do
    expect(User.new(valid_users.first.merge(email: "a@example,com"))).to be_invalid
  end

  it "email addresses should be unique" do
    User.create(valid_users.first)
    expect(User.new(valid_users.first)).to be_invalid
  end

  it "email should be saved as lower-case" do
    user = User.new(valid_users.first.merge(email:"AAAA@example.com"))
    user.save
    expect(user.reload.email).to eq "aaaa@example.com"
  end

end
