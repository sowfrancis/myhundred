require 'rails_helper'

RSpec.describe CreateSong do

  context "when the form is valid" do
    it "broadcast ok" do
      user = Fabricate(:user)
      song = Fabricate(:song)
      form = stub_form(:valid? => true, name: song.name, description: song.description,
                        user_id: user.id, image: song.image.url, link_music: song.link_music)
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