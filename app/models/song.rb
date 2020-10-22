class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(a_name)
    self.artist = Artist.find_or_create_by(name: a_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes=(song_notes)
    song_notes.each do |c|
      new_note = Note.create(content: c)
      self.notes << new_note
    end
  end
end
