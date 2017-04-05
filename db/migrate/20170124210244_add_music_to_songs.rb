class AddMusicToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :music, :string
  end
end
