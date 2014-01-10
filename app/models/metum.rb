class Metum < ActiveRecord::Base
  attr_accessible :key, :value
  
  def set v
    self.value = v
    self.save
    self
  end
end
