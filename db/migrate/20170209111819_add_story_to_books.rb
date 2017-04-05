class AddStoryToBooks < ActiveRecord::Migration
  def change
    add_column :books, :story, :text
  end
end
