class Note < ActiveRecord::Base
  # add associations here
  content :String
  belongs_to :song
end
