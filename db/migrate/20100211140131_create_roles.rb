class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    add_index(:roles, :name)
  end

  def self.down
    remove_index(:roles, :name)
    drop_table :roles
  end
end
