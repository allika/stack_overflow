class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.integer       :user_id
      t.string        :name,         :null => false, :default => ""
      t.text          :description,  :null => false, :default => "", :limit => 250
      t.integer       :usage,        :null => false, :default => 0
      t.timestamps
    end
    add_index :tags, [:user_id, :name, :usage]
  end

  def self.down
    drop_table :tags
  end
end
