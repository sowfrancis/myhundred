class FriendshipForm < Rectify::Form
  attribute :user_id, Integer
  attribute :friend_id,  Integer

  validate :uniq_friendship

  def uniq_friendship
    if context.user.friends.exists?(id: friend_id)
      errors.add(:friend_id, "you are already friend")
    end
  end
end