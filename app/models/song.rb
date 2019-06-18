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
    binding.pry
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    # binding.pry
    contents.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note
    end
  end

  def note_contents
    # binding.pry
    if self.notes
      self.notes.collect do |note|
        if !note.content.empty?
          note.content
        end
      end
    end.compact
  end
end
