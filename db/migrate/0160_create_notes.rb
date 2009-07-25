class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :name
      t.text :body
      t.references :notable, :polymorphic => true
      t.references :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
