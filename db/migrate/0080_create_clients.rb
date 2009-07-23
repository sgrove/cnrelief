class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.references :company
      t.string :name
      t.string :ship_from
      t.string :quickbooks_name
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
