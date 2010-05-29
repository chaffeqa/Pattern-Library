class AccessibilityFinding < ActiveRecord::Base
  belongs_to :pattern

  validates_presence_of :accessibility_finding
end
