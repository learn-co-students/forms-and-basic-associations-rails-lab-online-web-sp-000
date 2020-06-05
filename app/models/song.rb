class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(new_name)
    self.artist = Artist.find_or_create_by(name: new_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil 
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes=(notes)
    byebug
  end
end
