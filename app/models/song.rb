require_relative "./concerns/findable.rb"

class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes
  extend Findable

  def genre_name=(genre)
    self.genre=Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre? self.genre.name:nil
  end

  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def note_contents
    self.notes
  end

  def note_contents=(notes)
    notes.each do |n|
      self.notes<<n
    end
  end

end
