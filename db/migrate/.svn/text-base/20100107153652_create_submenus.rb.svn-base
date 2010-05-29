class CreateSubmenus < ActiveRecord::Migration
  def self.up
    create_table :submenus do |t|
      t.integer :pattern_id
      t.integer :menu_id

      t.timestamps
    end

    add_index(:submenus, [:pattern_id, :menu_id], :unique => true)
  end

  def self.down
    remove_index(:submenus, [:pattern_id, :menu_id])
    drop_table :submenus
  end
end
