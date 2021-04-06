
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
  
  def notes_content=(str)
    str.each do |s|
      note = Note.create(content: s)
      self.notes << note 
    end 
  end 

  def notes_content
    self.notes ? self.notes.map { |c| c.content } : nil
  end

end
