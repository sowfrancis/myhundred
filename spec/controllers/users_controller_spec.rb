require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET index and search" do
    let(:user){Fabricate(:user)}
    let(:user2){Fabricate(:user)}
    let(:friend){Fabricate(:friendship, user_id: user.id, friend_id: user2.id)}

    it "list all user friends" do
      sign_in user
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Put update " do
    let(:user){Fabricate(:user)}

    it "should update a song" do
      @attr = {first_name: "Snoop-Dogg"}
      sign_in user
      put :update, id: user, user: @attr
      user.reload
      expect(user.first_name).to eq "Snoop-Dogg"
    end
  end

  describe "GET show" do
    let(:user){Fabricate(:user)}

    it "render show" do
      get :show, id: user
      expect(user).to render_template :show
    end
  end
end
