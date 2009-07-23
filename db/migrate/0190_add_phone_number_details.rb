class AddPhoneNumberDetails < ActiveRecord::Migration
  def self.up
    add_column :phone_numbers, :phonable_id, :integer
    add_column :phone_numbers, :phonable_type, :string
    add_column :phone_numbers, :name, :string
    add_column :phone_numbers, :number, :string
    add_column :phone_numbers, :extension, :integer
  end

  def self.down
    remove_column :phone_numbers, :phonable_id
    remove_column :phone_numbers, :phonable_type
    remove_column :phone_numbers, :name
    remove_column :phone_numbers, :number
    remove_column :phone_numbers, :extension
  end
end
