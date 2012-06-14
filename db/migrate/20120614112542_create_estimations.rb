class CreateEstimations < ActiveRecord::Migration
  def self.up
    create_table :estimations do |t|
      t.integer :comment_id
      t.integer :user_id
      t.boolean :plus,      :default => 0
      t.timestamps
    end
    add_index :estimations, [:comment_id, :user_id]
  end

  def self.down
    drop_table :estimations
  end
end