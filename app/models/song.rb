class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(contents)
    contents.each do |c|
      if !c.empty?
        note = Note.create(content: c, song_id: self.id)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end 

end
