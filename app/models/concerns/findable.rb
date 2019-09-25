module Findable
  def find_or_create_by(name)
    if self.all.find{|s|s.name==name}
      self.all.find{|s|s.name==name}
    else
      self.create(name: name)
    end
  end
end
