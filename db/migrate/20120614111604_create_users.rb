class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name, :limit => 25
      t.string :last_name, :limit => 35
      t.string :username, :limit => 35
      t.string :email, :null => false, :default => '', :limit => 60
      t.string :password_digest
      t.string :remember_token
      t.timestamps
    end
    add_index :users, :username
    add_index :users, :email
    add_index :users, :remember_token
  end

  def self.down
    drop_table :users
  end
end
