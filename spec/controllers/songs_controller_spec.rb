require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe "GET index and search" do
    let(:song){Fabricate(:song)}
    let(:user){Fabricate(:user)}
    let(:search){Song.search(index_name: [User, Song])}

    it "list all song" do
      get :index
      expect(assigns(:songs)).to eq ([song])
    end

    it "search a song" do
      get :index, query: "bala"
      expect(assigns(:songs)).to eq [song]
    end
  end

  describe "GET show" do
    let(:song){Fabricate(:song)}

    it "render show" do
      get :show, id: song
      expect(song).to render_template :show
    end
  end

  describe "POST create " do
    let(:user){Fabricate(:user)}

    it "create a track" do
      sign_in user
      post :create, song: Fabricate.attributes_for(:song)
      expect(Song.count).to eq 1
    end
  end


  describe "Destroy" do
    let(:song){Fabricate(:song)}
    let(:user){Fabricate(:user)}

    it "should update a song" do
      sign_in user
      get :destroy, id: song
      expect(Song.count).to eq 0
    end
  end
end