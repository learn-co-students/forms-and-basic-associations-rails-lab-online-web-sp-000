class Note < ActiveRecord::Base
  belongs_to :songs
  
  validates :content, presence: true
end
