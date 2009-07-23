class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.references :order
      t.string :status

      t.string :name
      t.string :description
      t.string :alternate_name
      t.boolean :include_section_on_quote
      t.boolean :current_order

      t.string :ink_coverage
      t.boolean :bleeds
      t.integer :ink_side_1
      t.string :ink_side_1_colors
      t.integer :ink_side_2
      t.string :ink_side_2_colors

      t.references :paper_stock
      t.text :stock_description
      t.boolean :customer_supplied_stock

      t.references :press

      t.string :parent_size
      t.string :press_size
      t.integer :out
      t.integer :signature
      t.integer :pages
      t.string :layout
      t.float :stock_sell_percent

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
