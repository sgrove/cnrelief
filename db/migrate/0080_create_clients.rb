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

    clnt = Client.new \
            :company_id => 1,
            :name => "MiloStudy",
            :ship_from => false,
            :quickbooks_name => "MiloStudy, Inc.",
            :notes => "A website for international students. One of our oldest clients. Also a test."
  end

  def self.down
    drop_table :clients
  end
end
