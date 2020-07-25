class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes_content=(notes_content)
    notes_content.each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

  def notes_content
    a = []
    self.notes.each do |note|
      a << note.content unless note.content.empty?
    end
    a
  end
 
end
