class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
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
    self.genre.name if self.genre
  end

  def note_contents=(inputs)
    inputs.each do |info|
      note = Note.find_or_create_by(content: info)
      self.notes << note
    end
  end

  def note_contents
    content = []
    self.notes.each do |note|
      content << note.content
    end
    content
  end

end
