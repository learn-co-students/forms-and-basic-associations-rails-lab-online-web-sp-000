class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_id=(name)
    self.genre = Genre.find_by(name: name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def notes_content=(content)
    content.each do |note|
      self.notes << Note.find_or_create_by(content: note)
    end
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  

end
