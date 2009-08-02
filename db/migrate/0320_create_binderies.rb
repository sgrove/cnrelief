class CreateBinderies < ActiveRecord::Migration
  def self.up
    create_table :binderies do |t|
      t.references :company
      t.string :name

      t.timestamps
    end

    bndr = Bindery.create \
    :company_id => 1,
    :name => 'primary'
  end

  def self.down
    drop_table :binderies
  end
end
