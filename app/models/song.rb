class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
end

def artist_name
  self.artist.name
end

def artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
end

def genre_name
  self.genre.name
end

def genre_name=(name)
  self.genre = Genre.find_or_create_by(name: name)
  self.genre_id = genre.id
  self.save
end

def notes_contents
  self.notes.map(&:content)
end

def notes_contents=(notes)
  notes.each do |content|
    if content.strip != ''
      self.notes.build(content: content)
    end
  end
end



