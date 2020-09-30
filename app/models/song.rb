class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_artist_name
    self.artist ? self.artist.name : nil
  end

  def song_genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def song_genre_name
    self.genre ? self.genre.name : nil
  end

  def song_notes=(ids)
    ids.each do |id|
      note = Note.find_or_create_by(id: id)
      self.notes << note
    end
  end
end
