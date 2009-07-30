class CreateCosts < ActiveRecord::Migration
  def self.up
    create_table :costs do |t|
      t.references :cost_set
      t.references :costable, :polymorphic => true
      t.string :category
      t.string :name
      t.string :variable_on
      t.float :cost
      t.float :adjustment
      
      t.timestamps
    end

  cst = Cost.create \
  :cost_set_id => 1,
  :costable_id => 1,
  :costable_type => "Press",
  :category => "press",
  :name => "hourly",
  :variable_on => "hourly",
  :cost => 411.15,
  :adjustment => 0

  end

  def self.down
    drop_table :costs
  end
end
