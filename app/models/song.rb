class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes
  extend Findable::find_or_create_by

  def genre_name=(genre)
    self.genre=Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre? self.genre.name : nil
  end
end
