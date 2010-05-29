class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
    add_index(:users, :name, :unique => true)
  end

  def self.down
    remove_index(:users, :name)
    drop_table :users
  end
end
