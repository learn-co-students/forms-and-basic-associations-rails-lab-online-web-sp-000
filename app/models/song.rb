require 'pry'

class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    contents = []
    self.notes.each do |note|
      if !note.content.blank?
        contents << note.content
      end
    end
    contents
  end

  def note_contents=(new_content)
    new_content.each do |new_note|
      self.notes << Note.create(content: new_note)
    end
  end
end
