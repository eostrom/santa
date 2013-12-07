class AddSongInfoToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :title, :string
    add_column :gifts, :artist, :string
  end
end
