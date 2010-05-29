class Group < ActiveRecord::Base
  has_many :assigned_groups, :dependent => :destroy
  has_many :users, :through => :assigned_groups
  has_one :tag

  
  validates_presence_of :name
  validates_uniqueness_of :name
  validate :has_tag?

  private

  # Makes sure this group gets a tag when created
  def has_tag?
    unless Tag.exists?(:name => self.name)
      self.create_tag(:name => self.name)
    else
      self.tag = Tag.find_by_name(self.name)
    end
    false
  end
end
