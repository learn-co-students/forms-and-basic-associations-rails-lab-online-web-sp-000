class Song < ActiveRecord::Base
  # add associations here

  belongs_to :genre
  belongs_to :artist
  has_many :notes

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
    self.genre ? self.genre.name : nil
  end

  def song_notes_1=(content)
    self.notes = Note.find_or_create_by(content: content)
  end

  # def song_notes_1
  #   self.notes ? self.notes.content : nil
  # end

end
