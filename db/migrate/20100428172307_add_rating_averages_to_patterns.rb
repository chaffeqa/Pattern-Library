class AddRatingAveragesToPatterns < ActiveRecord::Migration
  def self.up
    add_column :patterns, :rating_average_usefulness, :decimal, :default => 0, :precision => 6, :scale => 2
    add_column :patterns, :rating_average_description, :decimal, :default => 0, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :patterns, :rating_average_usefulness
    remove_column :patterns, :rating_average_description
  end

end
