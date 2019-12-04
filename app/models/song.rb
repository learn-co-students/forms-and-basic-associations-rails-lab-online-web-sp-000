class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_artist_name
    self.artist ? self.artist.name : nil
  end



end
