class CreatePresses < ActiveRecord::Migration
  def self.up
    create_table :presses do |t|
      t.references :company
      t.string :presses, :name
      t.integer :presses, :washup_initial_minutes
      t.integer :presses, :washup_additional_minutes
      t.integer :presses, :plate_intitial_minutes
      t.integer :presses, :plate_additional_minutes
      t.integer :presses, :die_cut_minutes
      t.integer :presses, :kiss_cut_minutes
      t.integer :presses, :foil_minutes
      t.integer :presses, :emboss_minutes
      t.integer :presses, :normal_run_rate
      t.integer :presses, :minimum_run_rate
      t.integer :presses, :make_ready_sheets
      t.float :presses, :discount_percentage
      t.float :presses, :discount_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :presses
  end
end
