class RenamePhoneableColumn < ActiveRecord::Migration
  def self.up
    rename_column :phone_numbers, :phonable_id, :phoneable_id
    rename_column :phone_numbers, :phonable_type, :phoneable_type
  end

  def self.down
    rename_column :phone_numbers, :phoneable_id, :phonable_id
    rename_column :phone_numbers, :phoneable_type, :phonable_type
  end
end
