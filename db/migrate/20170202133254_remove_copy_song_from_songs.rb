class RemoveCopySongFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :copy_song, :boolean
  end
end
