class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.integer       :user_id
      t.string        :name,           :null => false, :default => ""
      t.text          :description
      t.integer       :popularity,     :null => false, :default => 0
      t.timestamps
    end
    add_index :tags, [:user_id, :name, :popularity]
  end

  def self.down
    drop_table :tags
  end
end
