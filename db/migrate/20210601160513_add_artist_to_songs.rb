class AddArtistToSongs < ActiveRecord::Migration[5.0]
  def change
    add_reference :songs, :artist, index: true, foreign_key: true
  end
end
