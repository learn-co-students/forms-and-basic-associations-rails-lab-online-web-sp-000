class Genre < ActiveRecord::Base
  # add associations
  belongs_to :song
end
