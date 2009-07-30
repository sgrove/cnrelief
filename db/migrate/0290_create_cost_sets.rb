class CreateCostSets < ActiveRecord::Migration
  def self.up
    create_table :cost_sets do |t|
      t.integer :company_id
      t.string :name

      t.timestamps
    end

  cs = CostSet.create :company_id => 1, :name => "primary"

  end


  def self.down
    drop_table :cost_sets
  end
end
