class CreatePatternTags < ActiveRecord::Migration
  def self.up
    create_table :pattern_tags do |t|
      t.integer :pattern_id
      t.integer :tag_id

      t.timestamps
    end

    add_index(:pattern_tags, [:pattern_id, :tag_id], :unique => true)
  end

  def self.down
    remove_index(:pattern_tags, [:pattern_id, :tag_id])
    drop_table :pattern_tags
  end
end
