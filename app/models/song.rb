class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre 
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name 
    self.artist ? self.artist.name : nil
  end

  def note_contents=(array)
    
    self.notes << Note.create!(content: array[0])
    self.notes << Note.create!(content: array[1])
    self.save
  end

end
