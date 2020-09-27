class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(arg)
    self.artist = Artist.find_or_create_by(name: arg)
  end

  def note_contents=(arg)
    arg.each do |v|
      if v != ""
        self.notes.build(content: v)
      end
    end
  end

end
