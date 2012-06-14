class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name, :limit => 25
      t.string :last_name, :limit => 35
      t.string :username, :limit => 35
      t.string :email, :null => false, :default => '', :limit => 60
      t.string :hashed_password, :limit => 40
      t.string :salt, :limit => 40
      t.timestamps
    end
    add_index(:users, :username)
  end

  def self.down
    drop_table :users
  end
end
