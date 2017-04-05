class AddCopySongToSong < ActiveRecord::Migration
  def change
    add_column :songs, :copy_song, :boolean
  end
end
