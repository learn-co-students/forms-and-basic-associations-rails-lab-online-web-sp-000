class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

#custom setter and getter, convenience attributes
#artist_name= setter method. called whenever a song is initialized with a artist name
#this method intercepts the call to the database, makes the Artist exist and provides it in memory for the song model
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : ''
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : ''
  end

  def note_contents
    notes.collect {|note| note.content}
  end

  def note_contents=(notes)
    notes.each do |content|
      note = self.notes.build(content: content) unless content.empty?
    end
  end

end
