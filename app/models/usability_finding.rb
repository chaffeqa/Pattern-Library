class UsabilityFinding < ActiveRecord::Base
  belongs_to :pattern

  validates_presence_of :usability_finding
end
