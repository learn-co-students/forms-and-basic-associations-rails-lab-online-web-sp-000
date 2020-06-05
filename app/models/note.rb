class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song

  def notes=(notes)
    byebug
  end
end
