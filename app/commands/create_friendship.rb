class CreateFriendship < Rectify::Command

  def initialize(form, current_user)
    @form = form
    @current_user = current_user
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      create_friendship
    end

    broadcast(:ok)
  end

  private

  attr_reader :form
  attr_reader :current_user

  def create_friendship
    @form = @current_user.friendships.create(friend_id: @form.friend_id)
  end
end