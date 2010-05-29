class Submenu < ActiveRecord::Base
  belongs_to :menu
  belongs_to :pattern
end
