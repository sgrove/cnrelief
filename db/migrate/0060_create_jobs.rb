class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.references :client
      t.integer :number
      t.datetime :entered
      t.datetime :ordered
      t.references :estimator
      t.references :quoter
      t.references :csr
      t.references :contact

      t.integer :overs_on_shelf

      
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
