class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.integer :category_id
      t.integer :user_id
      t.string  :name, :limit => 200
      t.timestamps
    end
    add_index :themes, [:category_id, :user_id, :name]
  end

  def self.down
    drop_table :themes
  end
end
