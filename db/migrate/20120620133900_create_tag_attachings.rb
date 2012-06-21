class CreateTagAttachings < ActiveRecord::Migration
  def self.up
    create_table :tag_attachings do |t|
      t.integer      :tag_id
      t.integer      :comment_id
      t.integer      :user_id
      t.timestamps
    end
    add_index :tag_attachings, [:tag_id, :comment_id, :user_id]
  end

  def self.down
    drop_table :tag_attachings
  end
end
