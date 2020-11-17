class Artist < ActiveRecord::Base
  has_many :songs

  def artist_name
    self.name
  end

end
