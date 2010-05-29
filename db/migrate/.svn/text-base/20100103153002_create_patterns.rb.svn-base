class CreatePatterns < ActiveRecord::Migration
  def self.up
    create_table :patterns do |t|
      t.string :name
      t.text :description
      t.text :when_to_use
      t.text :how_to_interact
      t.text :how_to_implement
      t.text :why_use

      t.timestamps
    end

    add_index(:patterns, :name, :unique => true)
  end

  def self.down
    remove_index(:patterns, :name)
    drop_table :patterns
  end
end
