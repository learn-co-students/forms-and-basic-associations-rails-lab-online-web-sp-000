class Song < ActiveRecord::Base
  # add associations here

  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_info=(notes)
    notes.each do |note|
      if note != "" 
        self.notes.build(content: note)
      end
    end
  end

  def note_info
    self.notes.collect do |note|
      note.content
    end    
  end

  # def note_info
  #   self.notes.collect(&:content)
  # end


end
