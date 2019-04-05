class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents=(contents)
    contents.each do |c|
      self.notes << Note.find_or_create_by(content: c)
    end
  end

  def note_contents
    self.notes.collect {|n| n.content }.reject{|c| c.blank?}
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
   self.genre&.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist&.name
  end
end
