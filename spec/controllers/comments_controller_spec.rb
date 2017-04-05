require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "GET index" do
    let(:comment){Fabricate(:comment)}

    it "list all comments" do
      get :index
      expect(assigns(:comments)).to eq ([comment])
    end
  end

  describe "POST create" do
    let(:user){Fabricate(:user)}
    let(:song){Fabricate(:song)}

    it "create a comment" do
      sign_in user
      post :create, comment: Fabricate.attributes_for(:comment, song_id: song, user_id: user)
      expect(Comment.count).to eq 1
    end
  end

end
