class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def artist_name
    artist ? artist.name : nil
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def genre_name
    genre ? genre.name : nil
  end
  
  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end
  
  def note_contents
    self.notes.map { |note| note.content }
  end
  
  def note_contents=(notes)
    notes.each do |note|
      note = Note.create(content: note)
      self.notes << note if note.valid?
    end
  end
  
end
