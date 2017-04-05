class AddLinkMusicToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :link_music, :string
  end
end
