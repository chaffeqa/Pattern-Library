class CreateAssignedGroups < ActiveRecord::Migration
  def self.up
    create_table :assigned_groups do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end

    add_index(:assigned_groups, [:user_id, :group_id], :unique => true)
  end

  def self.down
    remove_index(:assigned_groups, [:user_id, :group_id])
    drop_table :assigned_groups
  end
end
