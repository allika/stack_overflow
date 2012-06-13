class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer  :theme_id
      t.integer  :user_id
      t.text     :body
      t.integer  :rating,     :null => false, :default => 0
      t.boolean  :top_level, :default => false
      t.timestamps
    end
    add_index :comments, [:theme_id, :user_id, :rating]
  end

  def self.down
    drop_table :comments
  end
end
