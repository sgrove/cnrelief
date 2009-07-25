class MakeContactsPolymorphic < ActiveRecord::Migration
  def self.up
    add_column :contacts, :contactable_id, :integer
    add_column :contacts, :contactable_type, :string
  end

  def self.down
    remove_column :contacts, :contactable_id
    remove_column :contacts, :contactable_type
  end
end
