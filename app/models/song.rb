class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


def artist_name
  if self.artist != nil
    self.artist.name
  end
end

def artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
end

def genre_name
  if self.genre != nil
  self.genre.name
  end
end

def genre_name=(name)
  self.genre = Genre.find_or_create_by(name: name)
  #self.genre_id = genre.id
  self.save
end

def note_contents
  self.notes.map(&:content)
end

def note_contents=(notes)
  notes.each do |content|
    if content.strip != ''
      self.notes.build(content: content)
    end
  end
end
end



