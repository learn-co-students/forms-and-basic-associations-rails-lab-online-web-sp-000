class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      if !note_content.empty? && !Note.find_by(content: note_content)
        note = Note.create(content: note_content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map {|note| note.content.strip}
  end
end
