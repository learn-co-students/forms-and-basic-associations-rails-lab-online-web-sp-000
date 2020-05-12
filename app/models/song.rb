class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genres
  has_many :notes

  def artist_name
    defined?(artist) ? artist&.name : nil
  end

  def artist_name=(name)
    binding.pry
    self.artist = Artist.find_or_create_by(name: name)
  end
end
