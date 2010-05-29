class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name
      t.integer :group_id

      t.timestamps
    end

    add_index(:tags, :name)
  end

  def self.down
    remove_index(:tags, :name)
    drop_table :tags
  end
end
