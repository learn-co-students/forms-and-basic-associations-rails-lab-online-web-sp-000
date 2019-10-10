class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
     self.genre ? self.genre.name : nil
  end

  #=> setting the has_many relationship with posts....
  def note_contents=(notes)
  
  #=>  iterate over each note that's submitted
    notes.each do |content|
  #=> confirm that the note is not empty
      if content.strip != ''
  #=> save note through the associated song
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
  

end
