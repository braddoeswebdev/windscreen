class Screen < ActiveRecord::Base
  attr_accessible :approved, :base, :enabled, :name, :notes, :user_id
  belongs_to :user

  def control_url
    self.base.last == '/' ? self.base + 'ctrl' : self.base + '/ctrl'
  end

  def base_url
    self.base
  end
end
