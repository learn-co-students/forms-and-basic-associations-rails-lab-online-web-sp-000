class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def note_contents
   self.notes.map(&:content)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.genre_id = genre.id
    self.save
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(notes)
    notes.each do |note|
      unless note == ""
       self.notes << Note.create(content: note)
       self.save
     end
    end
  end
end
