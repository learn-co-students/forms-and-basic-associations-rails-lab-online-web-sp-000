class Song < ActiveRecord::Base
  # add associations here
  has_many :notes

  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    @artist = Artist.find_or_create_by(name: name)
    self.artist = @artist
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes_attributes=(contents)
    contents.each do |content|
      self.notes << Note.create(content: content)
    end
  end

  def notes_attributes
    if !self.notes.empty?
      self.notes.each do |note|
        note.content
      end
    else
      nil
    end
  end

end
