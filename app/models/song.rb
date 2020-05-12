class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  #   accepts_nested_attributes_for :notes

  def artist_name
    defined?(artist) ? artist&.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents=(contents)
    # binding.pry
    contents.each do |c|
      next if c.empty?

      notes << Note.create(content: c, song_id: id)
    end
  end

  def note_contents
    notes.map { |note| note.content }
  end
end
