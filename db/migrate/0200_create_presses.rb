class CreatePresses < ActiveRecord::Migration
  def self.up
    create_table :presses do |t|
      t.references :company
      t.string :name
      t.integer :washup_initial_minutes
      t.integer :washup_additional_minutes
      t.integer :plate_initial_minutes
      t.integer :plate_additional_minutes
      t.integer :die_cut_minutes
      t.integer :kiss_cut_minutes
      t.integer :foil_minutes
      t.integer :emboss_minutes
      t.integer :normal_run_rate
      t.integer :minimum_run_rate
      t.integer :make_ready_sheets
      t.text :run_rates # Hash
      t.float :presses, :discount_percentage
      t.float :presses, :discount_hours

      t.timestamps
    end

    prs = Press.create \
    :company_id => 1,
    :name => "LS640P",
    :washup_initial_minutes => 30,
    :washup_additional_minutes => 7,
    :plate_initial_minutes => 35,
    :plate_additional_minutes => 10,
    :run_rates => {:light => 9500, :medium => 8000, :medium_heavy => 6500, :heavy => 5000}
  end

  def self.down
    drop_table :presses
  end
end
