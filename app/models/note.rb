class Note < ActiveRecord::Base
  belongs_to :song

  def song_ids=(ids)
    ids.each do |id|
      post = Post.find(id)
      self.posts << post
  end
end
