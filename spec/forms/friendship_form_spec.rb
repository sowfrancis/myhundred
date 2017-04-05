require 'rails_helper'

RSpec.describe FriendshipForm do

  let(:user){ Fabricate(:user)}
  let(:friend){ Fabricate(:user)}
  subject{ Fabricate(:friendship, user_id: user.id, friend_id: friend.id)}

  it " valid with all attributs" do
    expect(subject).to be_valid
  end
end