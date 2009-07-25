class CreatePaperStocks < ActiveRecord::Migration
  def self.up
    create_table :paper_stocks do |t|
      t.string :vendor
      t.integer :product_id
      t.string :category
      t.string :category_2
      t.string :parent_sheet
      t.integer :base_count
      t.integer :weight
      t.string :color
      t.string :finish
      t.float :retail_cost
      t.float :company_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :paper_stocks
  end
end
