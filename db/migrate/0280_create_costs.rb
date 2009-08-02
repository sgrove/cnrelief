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

  cst = Cost.create \
  :cost_set_id => 1,
  :costable_id => 1,
  :costable_type => "Bindery",
  :category => "fold",
  :name => "fold run letter",
  :variable_on => "quantity",
  :cost => 6.0,
  :adjustment => 0

  cst = Cost.create \
  :cost_set_id => 1,
  :costable_id => 1,
  :costable_type => "Bindery",
  :category => "stitch",
  :name => "flat stitchting",
  :variable_on => "quantity",
  :cost => 20.0,
  :adjustment => 0

  cst = Cost.create \
  :cost_set_id => 1,
  :costable_id => 1,
  :costable_type => "Bindery",
  :category => "cutting",
  :name => "10 up with bleed",
  :variable_on => "quantity",
  :cost => 14.0,
  :adjustment => 0

  cst = Cost.create \
  :cost_set_id => 1,
  :costable_id => 1,
  :costable_type => "Bindery",
  :category => "cutting",
  :name => "10 up no bleed",
  :variable_on => "quantity",
  :cost => 9.0,
  :adjustment => 0

  cst = Cost.create \
  :cost_set_id => 1,
  :costable_id => 1,
  :costable_type => "Letterpress",
  :category => "emboss",
  :name => "setup",
  :variable_on => "fixed",
  :cost => 45.00,
  :adjustment => 0

  cst = Cost.create \
  :cost_set_id => 1,
  :costable_id => 1,
  :costable_type => "Letterpress",
  :category => "emboss",
  :name => "run",
  :variable_on => "quantity",
  :cost => 35.00,
  :adjustment => 0

  end

  def self.down
    drop_table :costs
  end
end
