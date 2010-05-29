class Pattern < ActiveRecord::Base
  # If this pattern is deleted, the corresponding examples and findings are deleted
  has_many :accessibility_findings, :dependent => :destroy
  has_many :codes, :dependent => :destroy
  has_many :screenshots, :dependent => :destroy
  has_many :usability_findings, :dependent => :destroy
  has_many :submenus, :dependent => :destroy
  has_many :menus, :through => :submenus
  has_many :pattern_tags, :dependent => :destroy
  has_many :tags, :through => :pattern_tags
  has_many :edit_histories, :order => "created_at", :dependent => :destroy
  has_one :thumbnail, :dependent => :destroy
  belongs_to :user

  ajaxful_rateable :dimensions => [:usefulness, :description], :allow_update => true

  validates_presence_of :name, :description, :when_to_use, :how_to_interact, :how_to_implement, :why_use
  validates_uniqueness_of :name
  validates_associated :accessibility_findings, :codes, :screenshots, :usability_findings
  validates_inclusion_of :status, :in => %w(approved needs_approval rejected)


  def author_name
    if self.user
      return self.user.get_display_name
    else
      return "Unknown"
    end
  end

end
