class Song < ActiveRecord::Base
  # add associations here
   has_many :notes
   belongs_to :genre
   belongs_to :artist
  
   def artist_name
    self.artist.name
   end
   
   def genre_name
     self.genre.name
   end
   
   def note_content
     note_content = self.note.content
     @song_notes << note_content
     note_content
   end
   
   @song_notes = []
   
   def song_notes
     @song_notes
  end
    
end
