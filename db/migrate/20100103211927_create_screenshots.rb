class CreateScreenshots < ActiveRecord::Migration
  def self.up
    create_table :screenshots do |t|
      t.integer :pattern_id
      t.string :name
      t.string :content_type
      # If using MySQL, blobs default to 64k, so we have to give
      # an explicit size to extend them
      t.binary :data, :limit => 300.kilobytes
      t.string :source
      t.boolean :pearson_product
      t.boolean :premier
      t.timestamps
    end

    add_index(:screenshots, :pattern_id)
  end

  def self.down
    remove_index(:screenshots, :pattern_id)
    drop_table :screenshots
  end
end
