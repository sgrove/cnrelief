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
      t.integer :ink_count_side_1
      t.string :side_1_color_list
      t.integer :ink_count_side_2
      t.string :side_2_color_list

      t.references :paper_stock
      t.text :stock_description
      t.boolean :customer_supplied_stock

      t.references :press
      t.references :plate_machine
      t.references :proof_machine
      t.references :bindery_machine
      t.references :letterpress_machine

      t.string :press_size
      t.string :finish_flat_size
      t.string :finish_fold_size
      t.integer :out
      t.integer :ups
      t.integer :ups_2
      t.integer :signatures
      t.integer :pages
      t.string :layout
      t.float :stock_sell_percent

      # Hash table values: cost_name: cost_value
      t.text :prepress_list

      # Hash table values: :category => [cost_name, cost_name, cost_name, ...]
      t.text :bindery_list
      t.text :letterpress_list

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
    :ink_count_side_1 => 3,
    :side_1_color_list => "PMS",
    :ink_count_side_2 => 1,
    :side_2_color_list => "Black",
    :paper_stock_id => 1,
    :press_id => 1,
    :finish_flat_size => "8.5x11",
    :finish_fold_size => "8.5x11",
    :out => 2,
    :signatures => 1,
    :pages => 1,
    :bindery_machine_id => 1,
    :letterpress_machine_id => 1,
    :layout => "sheet-wise",
    :quantity_per_order => 1,
    :prepress_list => {:computer => 30, :epson_blueline => 2},
    :bindery_list => {:fold => ["fold run letter"], :stitch => ["flat stiching"], :collate => ["col setup - hand", "col 9 - hand"], :cutting => ["10 up no bleed", "bc add'l"]},
    :letterpress_list => {:emboss => ["emb setup", "emb run"]}
    

    sct = Section.create \
    :order_id => 1,
    :name => "cover",
    :description =>"It's a cover!",
    :include_on_quote => true,
    :ink_coverage => "heavy",
    :ink_count_side_1 => 2,
    :side_1_color_list => "PMS",
    :ink_count_side_2 => 2,
    :side_2_color_list => "PMS",
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
