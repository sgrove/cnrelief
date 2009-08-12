class CreatePresses < ActiveRecord::Migration
  def self.up
    create_table :presses do |t|
      t.references :company
      t.string :name
      t.string :size
      t.integer :washup_initial_minutes
      t.integer :washup_additional_minutes
      t.integer :plate_initial_minutes
      t.integer :plate_additional_minutes
      t.text :run_rates # Hash

      t.timestamps
    end

    prs = Press.create \
    :company_id => 1,
    :name => "LS640P",
    :size => "40",
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
