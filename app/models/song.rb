class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes_1=(content)
    @notes_1 = Note.create(song_id: self.id, content: content)
    self.notes.push(@notes_1)
  end

  def notes_2=(content)
    @notes_2 = Note.create(song_id: self.id, content: content)
    self.notes.push(@notes_2)
  end

  def notes_1
    @notes_1 ? @notes_1.content : nil
  end

  def notes_2
    @notes_2 ? @notes_2.content : nil
  end

end
