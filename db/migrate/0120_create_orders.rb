class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.references :entry
      t.references :estimator
      t.references :csr
      t.references :job
      t.references :biller
      t.references :cost_set

      t.references :contact

      t.boolean :billing_on_hold
      t.string :type
      t.string :po
      t.string :turnaround
      t.text :description
      t.string :status

      t.integer :final_quantity
      t.integer :quantity_ordered
      t.integer :quantity_overs
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

    ord = Order.create \
    :estimator_id => 1,
    :csr_id => 2,
    :job_id => 1,
    :biller_id => 1,
    :cost_set_id => 1,
    :quantity_ordered => 1000,
    :finish_flat_size => "8.5x11",
    :finish_fold_size => "8.5x11",
    :quoted_on => 5.days.ago,
    :ordered_on => 2.days.ago,
    :due_by => Time.now + 4.days
    
  end

  def self.down
    drop_table :orders
  end
end
