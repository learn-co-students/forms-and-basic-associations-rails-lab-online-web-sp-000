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

  # def notes_attributes_0_content=(content)
  #   self.create_note(content: content)
  # end

  # def notes_attributes_1_content=(content)
  #   self.create_note(content: content)
  # end

  def notes=(notes)
    notes.each do |note|
      new_note = Note.create(content: note)
      self.notes << new_note
    end
  end

end
