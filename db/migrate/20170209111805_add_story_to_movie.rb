class AddStoryToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :story, :text
  end
end
