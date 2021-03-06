class CreateQuantities < ActiveRecord::Migration
  def self.up
    create_table :quantities do |t|
      t.references :order
      t.integer :amount
      t.float :markup

      t.timestamps
    end
  end

  def self.down
    drop_table :quantities
  end
end
