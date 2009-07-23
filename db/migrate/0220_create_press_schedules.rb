class CreatePressSchedules < ActiveRecord::Migration
  def self.up
    create_table :press_schedules do |t|
      t.references :section
      t.integer :priority
      t.datetime :scheduled
      t.datetime :started
      t.datetime :completed
      

      t.timestamps
    end
  end

  def self.down
    drop_table :press_schedules
  end
end
