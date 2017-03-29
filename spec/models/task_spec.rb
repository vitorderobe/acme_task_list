require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:valid_task) {
    {
      description: "My task",
    }
  }

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
    expect(@list.tasks.build(valid_task)).to be_valid
  end

  it "list id should be present" do
    expect(Task.new(valid_task)).to be_invalid
  end

  it "description should be present" do
    setup
    expect(@list.tasks.build(valid_task.merge(description: " "))).to be_invalid
  end

end
