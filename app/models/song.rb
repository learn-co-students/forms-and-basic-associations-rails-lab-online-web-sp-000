class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
      a = Artist.find_or_create_by(name: name)
      self.artist = a
    end

    def artist_name
      self.artist ? self.artist.name : nil
    end

    def genre_name=(name)
      g = Genre.find_or_create_by(name: name)
      self.genre = g
    end

    def genre_name
      self.genre ? self.genre.name : nil
    end

    def note_contents=(notes)
      notes.each do |content|
        note = self.notes.build(content: content) unless content.empty?
      end
    end

    def note_contents
      notes.collect{|n| n.content}
    end
end
