class Tag < ActiveRecord::Base
  has_many :pattern_tags, :dependent => :destroy
  has_many :patterns, :through => :pattern_tags
  belongs_to :group

  validates_uniqueness_of :name

  # Deletes itself it will be unassigned after patter_tag is deleted unassigned
  def check_if_unassigned
    if self.pattern_tags.size ==0
      self.destroy
    end
  end
end
