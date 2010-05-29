class CreateParentMenus < ActiveRecord::Migration
  def self.up
    create_table :parent_menus do |t|
      t.string :name

      t.timestamps
    end
    add_index(:parent_menus, :name)
  end

  def self.down
    remove_index(:parent_menus, :name)
    drop_table :parent_menus
  end
end
