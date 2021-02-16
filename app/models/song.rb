class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes
  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes=(contents)
    contents.each do |c|
      if !c.empty?
        new_note = Note.create(content: c, song_id: self.id)
        self.notes << new_note
      end
    end
  end
end