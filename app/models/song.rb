class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre 
  belongs_to :artist
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def notes_contents=(array)
    array.each do |note|
      self.notes.build(content: note)
    end
  end

end
