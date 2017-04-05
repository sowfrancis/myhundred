class RemoveMusicFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :music, :string
  end
end
