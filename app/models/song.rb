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

  def notes_content=(array)
    array.each do |x|
      note = Note.create(content: x)
      #Note.find_or_create_by if you don't want content to duplicate in the Notes.all 
      self.notes << note 
    end 
  end 

  def notes_content
    self.notes ? self.notes.map { |c| c.content } : nil
    #If ? then 1 : then 2
  end 
end
