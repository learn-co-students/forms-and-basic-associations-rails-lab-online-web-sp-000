
require_relative "./concerns/findable.rb"
class Genre < ActiveRecord::Base
  # add associations
  has_many :songs
  extend Findable
end
