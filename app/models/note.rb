class Note < ActiveRecord::Base
  # validates :name, presense: true
  belongs_to :song
end
