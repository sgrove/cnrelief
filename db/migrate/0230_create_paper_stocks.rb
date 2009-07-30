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

    ps = PaperStock.create \
    :vendor => "Spicier Papers, Inc.",
    :product_id => "000001002",
    :category => "Plain",
    :category_2 => "Plainer",
    :parent_sheet => "28x40",
    :base_count => 1000,
    :weight => 145,
    :color => "white",
    :finish => "matte",
    :retail_cost => 217.77,
    :company_cost => 185.10
    
  end

  def self.down
    drop_table :paper_stocks
  end
end
