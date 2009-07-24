class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.references :entry
      t.references :estimator
      t.references :csr
      t.references :job
      t.references :biller

      t.references :contact

      t.boolean :billing_on_hold
      t.string :type
      t.string :po
      t.string :turnaround
      t.text :description

      t.integer :final_quantity
      t.integer :quantity_ordered
      t.integer :quanitity_overs
      t.integer :overs_on_shelf

      t.integer :quote_number
      t.string :form_number
      t.integer :consecutive_start
      t.integer :consecutive_end
      t.integer :number_of_parts
      
      t.string :proof
      t.string :finish_flat_size
      t.string :finish_fold_size

      t.datetime :quoted_on
      t.datetime :ordered_on
      t.datetime :due_by
      
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
