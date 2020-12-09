class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name:artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes=(song_notes)
    song_notes.each do |note|
      if note.strip != ""
        baby_note = Note.find_or_create_by(:content => note)
        self.notes << baby_note
      end
    end
  end

  def song_notes
    self.notes.each {|n|n.content}
  end

end
