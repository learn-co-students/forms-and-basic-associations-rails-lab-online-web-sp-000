class AddSongIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :song_id, :integer
    add_column :notes, :notes_1, :string
  end
end
