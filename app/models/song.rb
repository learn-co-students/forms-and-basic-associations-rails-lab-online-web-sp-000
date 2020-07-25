
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  
  end 

  def artist_name
    if self.artist 
      self.artist.name
    end 
  end 

  def notes_contents=(array)
    array.each do |string|
      if string != "" 
        note = Note.create(content: string)
       self.notes << note 
      end 
    end 
  end 

  def notes_contents
    if self.notes != []
      self.notes.collect do |note|
      end 
    end 
  end

end
