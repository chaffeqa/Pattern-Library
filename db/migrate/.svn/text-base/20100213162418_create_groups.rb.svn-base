class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end
    add_index(:groups, :name)
  end

  def self.down
    remove_index(:groups, :name)
    drop_table :groups
  end
end
