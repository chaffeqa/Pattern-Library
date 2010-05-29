class ParentMenu < ActiveRecord::Base
  has_many :menus, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name  
end
