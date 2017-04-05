require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  describe "POST create " do
    let(:user){Fabricate(:user)}
    let(:friend){Fabricate(:user)}

    it "create a friendship" do
      sign_in user
      post :create, frienship: Fabricate.attributes_for(:friendship, user_id: user.id, friend_id: friend.id)
      expect(Friendship.count).to eq 1
    end
  end

  describe "Destroy" do
    let(:user){Fabricate(:user)}
    let(:friend){Fabricate(:user)}
    let(:friendship){Fabricate(:friendship, user_id: user.id, friend_id: friend.id)}

    it "should destroy a friendship" do
      sign_in user
      get :destroy, id: friendship
      expect(Friendship.count).to eq 0
    end
  end
end
