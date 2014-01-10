class Flasher < ActiveRecord::Base
  attr_accessible :name, :graphic
  has_attached_file :graphic, :styles => {:screen => '240x96'}
end
