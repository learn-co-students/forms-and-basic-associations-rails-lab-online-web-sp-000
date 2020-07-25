class AddSongIdToNotes < ActiveRecord::Migration
  def change
    # add_column :notes, :song_id, :integer
    add_reference :notes, :song, index: true, foreign_key: true
  end
end
