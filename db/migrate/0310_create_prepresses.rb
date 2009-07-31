class CreatePrepresses < ActiveRecord::Migration
  def self.up
    create_table :prepresses do |t|
      t.references :company
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :prepresses
  end
end
