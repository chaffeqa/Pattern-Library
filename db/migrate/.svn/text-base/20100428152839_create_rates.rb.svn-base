class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.belongs_to :rater
      t.belongs_to :rateable, :polymorphic => true
      t.integer :stars, :null => false
      t.string :dimension
      t.timestamps
    end

    add_index :rates, :rater_id
    add_index :rates, [:rateable_id, :rateable_type]
  end

  def self.down
    remove_index(:rates, :rater_id)
    remove_index(:rates, [:rateable_id, :rateable_type])
    drop_table :rates
  end
end


