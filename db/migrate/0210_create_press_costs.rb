class CreatePressCosts < ActiveRecord::Migration
  def self.up
    create_table :press_costs do |t|
      t.references :press
      t.string :name
      t.float :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :press_costs
  end
end
