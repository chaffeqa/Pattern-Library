class CreateThumbnails < ActiveRecord::Migration
  def self.up
    create_table :thumbnails do |t|
      t.integer :pattern_id
      t.string :source
      # If using MySQL, blobs default to 64k, so we have to give
      # an explicit size to extend them
      t.binary :data, :limit => 50.kilobytes
      t.timestamps
    end
    add_index(:thumbnails, :pattern_id)
  end

  
  def self.down
    remove_index(:thumbnails, :pattern_id)
    drop_table :thumbnails
  end
end
