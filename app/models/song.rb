class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	self.artist.name if self.artist
  end

  def note_contents=(note_contents)
  	note_contents.each do |content|
  		unless content.empty?
  			self.notes << Note.create(content: content)
  			self.save
  		end
  	end
  end

  def note_contents
  	self.notes.map(&:content)
  end

end
	