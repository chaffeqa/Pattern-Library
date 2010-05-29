class EditHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :pattern

  validates_associated :user, :pattern
  validates_presence_of :user_id, :pattern_id
end
