class CreateEditHistories < ActiveRecord::Migration
  def self.up
    create_table :edit_histories do |t|
      t.integer :user_id
      t.integer :pattern_id
      t.text :note

      t.timestamps
    end

    add_index(:edit_histories, [:user_id, :pattern_id])
  end

  def self.down
    remove_index(:assigned_roles, [:user_id, :role_id])
    drop_table :edit_histories
  end
end
