class CreateEmployeeGroups < ActiveRecord::Migration
  def self.up
    create_table :employee_groups do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_groups
  end
end
