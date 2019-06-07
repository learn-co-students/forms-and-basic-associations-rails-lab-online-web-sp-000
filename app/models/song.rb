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
    self.genre ? self.genre.name : nil
  end

  def note_contents=(content)
    self.notes.build(content: content)
    self.save
  end

  def note_contents
    !!self.notes ? self.notes : nil
  end

  def song_notes_1=(content)
    self.notes.build(content: content)
    self.save
  end

  def song_notes_1
    self.notes[0] ? self.notes[0] : nil
  end

  def song_notes_2=(content)
    self.notes.build(content: content)
    self.save
  end

  def song_notes_2
    self.notes[1] ? self.notes[1] : nil
  end


end
