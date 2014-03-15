class User < ActiveRecord::Base
  attr_accessor :admin, :manager, :author, :operator
  attr_accessible :privilege, :username, :password, :admin, :manager, :author, :operator
  has_secure_password
  validates :password, :presence => {:on => :create}
  has_many :screens
  before_save :set_privilege

  def set_privilege
    self.privilege = 0
    self.privilege += 8 if self.admin
    self.privilege += 4 if self.manager
    self.privilege += 2 if self.author
    self.privilege += 1 if self.operator
  end

  # 1 - operator
  # 2 - author
  # 4 - manager
  # 8 - administrator

  def admin?
    self.privilege & 8 == 8
  end

  def manager?
    self.privilege & 4 == 4 || self.privilege & 8 == 8 
  end

  def author?
    self.privilege & 2 == 2 || self.privilege & 4 == 4 || self.privilege & 8 == 8
  end

  def operator?
    self.privilege & 1 == 1 || self.privilege & 4 == 4 || self.privilege & 8 == 8
  end

  def privilege_text
    ls = []
    ls << "Admin" if self.admin?
    ls << "Manager" if self.manager?
    ls << "Author" if self.author?
    ls << "Operator" if self.operator?
    ls.join ', '
  end

  def adminify
      self.privilege = 8
      self.save
  end
end
