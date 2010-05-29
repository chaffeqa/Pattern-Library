class AddColumnStatusToPatterns < ActiveRecord::Migration
  def self.up
    add_column :patterns, :status, :text
    #add_index(:patterns, :status)  This didnt work for some reason on production server
  end

  def self.down
    #remove_index(:patterns, :status)
    remove_column :patterns, :status
  end
end
