class FriendshipsController < ApplicationController

  def create
    @form = FriendshipForm.from_params(params).with_context(user: current_user)

    CreateFriendship.call(@form, current_user) do
      on(:ok) {redirect_to user_path(current_user), notice: "good shit"}
      on(:invalid) {redirect_to songs_path, notice: "You are already friend"}
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to user_path(current_user)
  end
end
