class Genre < ActiveRecord::Base
  # add associations
  has_many :songs

  def genre_name
    self.name
  end
end
