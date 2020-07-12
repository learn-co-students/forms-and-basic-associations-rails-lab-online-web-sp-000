class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name: nil
  end

  def genre_id=(id)
    self.genre=Genre.find_or_create_by(id:id)
  end

  def genre_id
    self.id ? self.genre.name: nil
  end

  def genre_id=(id)
    self.genre=Genre.find_or_create_by(id:id)
  end

  def genre_id
    self.id ? self.genre.name: nil
  end

  def song_note=(information)
    information.each do |info|
      content= Note.create(content: info)
      self.notes << content
    end
  end

  #@song.notes.each do |s|
   # puts s.content
  #end 
  

end
