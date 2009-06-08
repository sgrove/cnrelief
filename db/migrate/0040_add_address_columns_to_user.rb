class AddAddressColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
    add_column :users, :state, :string
  end

  def self.down
    remove_column :users, :address1, :string
    remove_column :users, :address2, :string
    remove_column :users, :city, :string
    remove_column :users, :zip, :string
    remove_column :users, :state, :string
  end
end
