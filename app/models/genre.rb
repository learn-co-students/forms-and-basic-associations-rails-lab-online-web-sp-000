class Genre < ActiveRecord::Base
  # add associations
  has_many :songs
  belongs_to :song
end
