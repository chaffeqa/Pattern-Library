class Menu < ActiveRecord::Base
  has_many :submenus, :dependent => :destroy
  has_many :patterns, :through => :submenus
  belongs_to :parent_menu

  validates_presence_of :name, :parent_menu_id
  validates_uniqueness_of :name

end
