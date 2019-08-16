class Song < ActiveRecord::Base
belongs_to :genre
belongs_to :artist
has_many :notes
# A text input box that sets the song's title.
# A text input box for the artist.
# A selection box for genre. Users should be able to pick amongst existing genres only.
# Several text input boxes to add notes to the song. These should have the IDs song_notes_1, song_notes_2, and so on for the specs to pass. (You might need to search around for how to pass an array using strong_params!) There are feature tests!
  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
         self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
      self.genre ? genre.name : nil
  end

  def note_contents=(note)
    note.each do |n|
      if !n.empty?
      # binding.pry
       self.notes.build(:content => n)
      end
    end
  end

  def note_contents
   self.notes.map do  |n|
     n.content
    end
  end
end
