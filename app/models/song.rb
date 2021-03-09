class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(s)
    self.artist = Artist.find_or_create_by(name: s)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes=(s)
    s.each do |content|
      next if content.empty?
      note = Note.create(content: content)
      self.notes << note
    end
  end
end
