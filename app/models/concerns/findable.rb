module Findable
  def find_or_create_by(name: the_name)
    if self.all.find{|s|s.name==the_name}
      self.all.find{|s|s.name==the_name}
    else
      self.create(name: the_name)
    end
  end
end
