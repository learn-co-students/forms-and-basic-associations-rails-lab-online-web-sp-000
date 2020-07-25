class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.id : nil
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
