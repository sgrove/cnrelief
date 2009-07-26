class CreateUserGroups < ActiveRecord::Migration
  def self.up
    create_table :user_groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :user_groups_users, :id => false do |t|
      t.integer :user_group_id
      t.integer :user_id
    end
    
    Lockdown::System.make_user_administrator(User.find(1))
    Lockdown::System.make_user_administrator(User.find(2))
  end

  def self.down
    drop_table :user_groups_users
    drop_table :user_groups
  end
end
