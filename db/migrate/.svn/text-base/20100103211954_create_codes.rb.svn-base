class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.integer :pattern_id
      t.string :code_url
      t.timestamps
    end

    add_index(:codes, :pattern_id)
  end

  def self.down
    remove_index(:codes, :pattern_id)
    drop_table :codes
  end
end
