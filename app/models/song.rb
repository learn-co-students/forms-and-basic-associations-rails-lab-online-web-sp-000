class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  #accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

    def notes_1=(content)
      note_1 = Note.find_or_create_by(id: 1)
      note_1.content = content
      self.notes << note_1
    end

    def notes_2=(content)
      note_2 = Note.find_or_create_by(id: 2)
      note_2.content = content
      self.notes << note_2
    end

    def notes_1
      self.notes.first.content
    end

    def notes_2
      self.notes.second ? self.notes.second.content : nil

    end


end
