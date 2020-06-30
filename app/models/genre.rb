class Genre < ActiveRecord::Base
  # add associations
  has_many :artists, through: :songs
  has_many :songs
end
