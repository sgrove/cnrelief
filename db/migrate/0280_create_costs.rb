class CreateCosts < ActiveRecord::Migration
  def self.up
    create_table :costs do |t|
      t.integer :costable_id
      t.string :costable_type
      t.string :category
      t.string :name
      t.boolean :variable_on_quantity
      t.float :cost
      
      t.timestamps
    end
  end

  def self.down
    drop_table :costs
  end
end
