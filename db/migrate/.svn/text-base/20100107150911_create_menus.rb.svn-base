class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.integer :parent_menu_id

      t.timestamps
    end
    add_index(:menus, :parent_menu_id)
    add_index(:menus, :name)
  end

  def self.down
    remove_index(:menus, :parent_menu_id)
    remove_index(:menus, :name)
    drop_table :menus
  end
end
