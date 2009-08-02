class CreateLetterpresses < ActiveRecord::Migration
  def self.up
    create_table :letterpresses do |t|
      t.references :company
      t.string :name

      t.timestamps
    end

    lp = Letterpress.create \
    :company_id => 1,
    :name => 'primary'

  end

  def self.down
    drop_table :letterpresses
  end
end
