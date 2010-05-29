class AddColumnToPattern < ActiveRecord::Migration
  def self.up
    add_column :patterns, :user_id, :integer
    add_index(:patterns, :user_id)
  end

  def self.down
    remove_index(:patterns, :user_id)
    remove_column :patterns, :user_id
  end
end
