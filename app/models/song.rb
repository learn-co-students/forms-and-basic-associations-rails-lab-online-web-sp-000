class Song < ActiveRecord::Base
  
  validates :title, presence: true

  belongs_to :artist
  belongs_to :genre

  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name 
    self.genre ? self.genre.name : nil
  end

  def note_contents
    self.notes.collect{ |x| x.content }
  end

  def note_contents=(notes_array)
    notes_array.each do |note|
      self.notes << Note.find_or_create_by(content: note) unless note.empty?
    end unless notes_array.all?{ |x| x.empty? }
  end


end
