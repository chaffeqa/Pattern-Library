class CreateAssignedRoles < ActiveRecord::Migration
  def self.up
    create_table :assigned_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end

    add_index(:assigned_roles, [:user_id, :role_id], :unique => true)
  end

  def self.down
    remove_index(:assigned_roles, [:user_id, :role_id])
    drop_table :assigned_roles
  end
end
