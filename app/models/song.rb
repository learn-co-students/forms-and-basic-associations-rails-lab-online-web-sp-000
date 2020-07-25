class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  has_many :notes
  belongs_to :genre

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

  def note_contents=(content_array)
    content_array.each do |phrase|
      if phrase != ''
        note = Note.create(content: phrase, song_id: self.id)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
