require_relative "./concerns/findable.rb"

class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs
  extend Findable
end
