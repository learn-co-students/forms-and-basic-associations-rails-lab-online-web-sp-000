class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(input)
    self.artist = Artist.find_or_create_by(name: input)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(input)
    self.genre = Genre.find_or_create_by(name: input)
  end

  def note_contents
    all_notes = []
    self.notes.each do |note|
      all_notes << note.content
    end
    all_notes
  end

  def note_contents=(array_of_notes)
    array_of_notes.each do |new_note|
      self.notes << Note.find_or_create_by(content: new_note) if !new_note.blank?
    end
  end
end
