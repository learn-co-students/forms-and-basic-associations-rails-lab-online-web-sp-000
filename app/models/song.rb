class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def note_contents=(contents)
    contents.each do |content|
      note = Note.new(content:content)
      if note.valid?
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
