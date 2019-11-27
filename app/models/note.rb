class Note < ActiveRecord::Base
  # add associations here
  beongs_to :song
end
