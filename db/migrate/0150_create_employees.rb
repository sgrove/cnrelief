class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :username
      t.references :employee_group
      t.references :company
      t.string :permissions

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
