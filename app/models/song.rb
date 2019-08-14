class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes



def genre_name=(name)
  self.genre = Genre.find_or_create_by(name: name)
end

def genre_name
   self.genre ? self.genre.name : nil
end




def artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
end

def artist_name
   self.artist ? self.artist.name : nil
end





def note_contents=(content)
#  binding.pry
all_notes =[]
  self.notes.each do |id|
    note = Note.find(id)
    all_notes << note
  end
end

def note_contents
   self.note ? self.note.content : nil
end
