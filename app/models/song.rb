class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
     self.genre = Genre.find_by(name: name)
   end

   def genre_name
      self.genre ? self.genre.name : nil
   end

   def artist_name=(name)
     self.artist = Artist.find_by(name: name)
   end

   def artist_name
     self.artist ? self.artist.name : nil
   end

   def note_ids=(notes)
     notes.each do |note|
       new_note = Note.new(content: note)
       self.notes << new_note
     end
   end
end
