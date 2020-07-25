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

  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def notes=(notes_array)
    notes_array.each do |note|
      self.notes << Note.create(content: note)
    end
  end

  def note_contents=(contents)
    contents.each do |note|
      if note != ""
        self.notes << Note.create(content: note)
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end
end
