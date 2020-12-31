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

  def note_content=(content)
    content.each do |content_piece|
      if content_piece != ""
        self.notes.build(content: content_piece)
        # note = Note.create(content: content_piece, song_id: self.id)
        # self.notes << note
      end
    end
  end
end
