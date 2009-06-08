class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :title
      t.string :copy1
      t.string :copy2
      t.string :size
      t.string :status
      t.string :campaign_type

      t.integer :user_id      

      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end
