require 'rails_helper'

RSpec.describe CreateFriendship do

  context "when the form is valid" do
    it "broadcast ok" do
      user = Fabricate(:user)
      friend = Fabricate(:user)
      form = stub_form(:valid? => true, user_id: user.id, friend_id: friend.id)
      command = described_class.new(form, user)
      expect{command.call}.to broadcast(:ok)
    end
  end

  context "when the form is invalid" do
    it "broadcast ok" do
      user = Fabricate(:user)
      form = stub_form(:valid? => false)
      command = described_class.new(form, user)
      expect{command.call}.to broadcast(:invalid)
    end
  end
end
