class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.references :order
      t.string :status

      t.string :name
      t.string :description
      t.string :alternate_name
      t.boolean :include_on_quote

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

      t.string :press_size
      t.string :finish_flat_size
      t.string :finish_fold_size
      t.integer :out
      t.integer :signatures
      t.integer :pages
      t.string :layout
      t.float :stock_sell_percent

      t.integer :quantity_per_order

      t.timestamps
    end

    sct = Section.create \
    :order_id => 1,
    :name => "letterhead",
    :description =>"Well, duh, a letterhead",
    :alternate_name => "l/h",
    :include_on_quote => true,
    :ink_coverage => "light",
    :ink_side_1 => 3,
    :ink_side_1_colors => "PMS",
    :ink_side_2 => 1,
    :ink_side_2_colors => "Black",
    :paper_stock_id => 1,
    :press_id => 1,
    :finish_flat_size => "8.5x11",
    :finish_fold_size => "8.5x11",
    :out => 2,
    :signatures => 1,
    :pages => 1,
    :layout => "perfect",
    :quantity_per_order => 2

    sct = Section.create \
    :order_id => 1,
    :name => "cover",
    :description =>"It's a cover!",
    :include_on_quote => true,
    :ink_coverage => "heavy",
    :ink_side_1 => 2,
    :ink_side_1_colors => "PMS",
    :ink_side_2 => 2,
    :ink_side_2_colors => "PMS",
    :paper_stock_id => 1,
    :press_id => 1,
    :finish_flat_size => "8.5x11",
    :finish_fold_size => "8.5x11",
    :out => 2,
    :signatures => 1,
    :pages => 1,
    :layout => "perfect",
    :quantity_per_order => 1

  end

  def self.down
    drop_table :sections
  end
end
