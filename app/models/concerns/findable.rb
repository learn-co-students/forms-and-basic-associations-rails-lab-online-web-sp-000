module Findable
  def find_or_create_by(hash)
    if self.all.find{|s|s.name==hash[:name]}
      self.all.find{|s|s.name==hash[:name]}
    else
      self.create(hash)
    end
  end
end
