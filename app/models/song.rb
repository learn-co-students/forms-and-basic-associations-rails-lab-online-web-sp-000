class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes_1
    self.notes[0] ? self.songs.first : nil
  end

  def note=(note)
    new_note = Note.new(content: note)
    self.notes << new_note
  end

  def notes_2
    self.notes[1] ? self.songs.last : nil
  end
end
