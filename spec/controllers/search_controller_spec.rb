require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET index" do
    let(:song){Fabricate(:song)}

    it "query" do
      get :search, query: "bala"
      binding.pry
      expect(assigns(:songs)).to eq ([song])
    end
  end
end
