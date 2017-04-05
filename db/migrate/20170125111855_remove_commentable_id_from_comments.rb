class RemoveCommentableIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_id, :intenger
  end
end
