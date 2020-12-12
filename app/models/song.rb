class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_accessor :notes_1, :notes_2

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def notes_1
    self.notes[0] ? self.notes[0].content : nil
  end

  def notes_1=(content)
    notes_1 = self.notes.build(content: content)
  end

  def notes_2
    self.notes[1] ? self.notes[1].content : nil
  end

  def notes_2=(content)
    notes_2 = self.notes.build(content: content)
  end

  # def genre_name
  #   self.genre ? self.genre.name : nil
  # end
  #
  # def genre_name=(name)
  #   self.genre = Genre.find_or_create_by(name: name)
  # end

  def genre_ids=(ids)
     ids.each do |id|
       genre = Genre.find(id)
       self.genres << genre
     end
  end

end
