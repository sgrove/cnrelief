class CreatePlatemachines < ActiveRecord::Migration
  def self.up
    create_table :platemachines do |t|
      t.references :company
      t.string :name

      t.timestamps
    end

    pm = Platemachine.create \
    :company_id => 1,
    :name => 'primary'
  end

  def self.down
    drop_table :platemachines
  end
end
