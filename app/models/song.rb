class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    if self.genre
      self.genre.name
    end
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    if self.artist
      self.artist.name
    end
  end
  
  def note_contents=(contents)
     contents.each do |content|
       if !content.empty?
         note = Note.find_or_create_by(content: content)
         self.notes << note
       end
     end
   end

   def note_contents
     self.notes.map do |note|
       if note.content != "" || note.content != nil
         note.content
       end
     end
   end
  
end
