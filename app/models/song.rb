class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name) #setter
    self.artist = Artist.find_or_create_by(name: name)
    self.save
  end

  def artist_name #getter
    self.artist ? self.artist.name : nil
  end

  def notes=(notes)
    notes.each do | note |
      newnote = Note.new(content: note)
      self.notes << newnote
    end
  end

end
