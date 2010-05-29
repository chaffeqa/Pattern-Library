class Role < ActiveRecord::Base
  has_many :assigned_roles, :dependent => :destroy
  has_many :users, :through => :assigned_roles

  validates_presence_of :name
  validates_uniqueness_of :name
end
