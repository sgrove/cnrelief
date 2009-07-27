# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 270) do

  create_table "addresses", :force => true do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "name"
    t.string   "email"
    t.string   "attention"
    t.string   "ship_to"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "ship_from"
    t.string   "quickbooks_name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "first"
    t.string   "middle"
    t.string   "last"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contactable_id"
    t.string   "contactable_type"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "client_id"
    t.integer  "number"
    t.datetime "entered"
    t.datetime "ordered"
    t.integer  "estimator_id"
    t.integer  "quoter_id"
    t.integer  "csr_id"
    t.integer  "contact_id"
    t.integer  "overs_on_shelf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "entry_id"
    t.integer  "estimator_id"
    t.integer  "csr_id"
    t.integer  "job_id"
    t.integer  "biller_id"
    t.integer  "contact_id"
    t.boolean  "billing_on_hold"
    t.string   "type"
    t.string   "po"
    t.string   "turnaround"
    t.text     "description"
    t.integer  "final_quantity"
    t.integer  "quantity_ordered"
    t.integer  "quanitity_overs"
    t.integer  "overs_on_shelf"
    t.integer  "quote_number"
    t.string   "form_number"
    t.integer  "consecutive_start"
    t.integer  "consecutive_end"
    t.integer  "number_of_parts"
    t.string   "proof"
    t.string   "finish_flat_size"
    t.string   "finish_fold_size"
    t.datetime "quoted_on"
    t.datetime "ordered_on"
    t.datetime "due_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paper_stocks", :force => true do |t|
    t.string   "vendor"
    t.integer  "product_id"
    t.string   "category"
    t.string   "category_2"
    t.string   "parent_sheet"
    t.integer  "base_count"
    t.integer  "weight"
    t.string   "color"
    t.string   "finish"
    t.float    "retail_cost"
    t.float    "company_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions_user_groups", :id => false, :force => true do |t|
    t.integer "permission_id"
    t.integer "user_group_id"
  end

  create_table "phone_numbers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.string   "name"
    t.string   "number"
    t.integer  "extension"
  end

  create_table "press_costs", :force => true do |t|
    t.integer  "press_id"
    t.string   "name"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "press_schedules", :force => true do |t|
    t.integer  "section_id"
    t.integer  "priority"
    t.datetime "scheduled"
    t.datetime "started"
    t.datetime "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presses", :force => true do |t|
    t.integer  "company_id"
    t.string   "presses"
    t.string   "name"
    t.integer  "washup_initial_minutes"
    t.integer  "washup_additional_minutes"
    t.integer  "plate_intitial_minutes"
    t.integer  "plate_additional_minutes"
    t.integer  "die_cut_minutes"
    t.integer  "kiss_cut_minutes"
    t.integer  "foil_minutes"
    t.integer  "emboss_minutes"
    t.integer  "normal_run_rate"
    t.integer  "minimum_run_rate"
    t.integer  "make_ready_sheets"
    t.float    "discount_percentage"
    t.float    "discount_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quantities", :force => true do |t|
    t.integer  "order_id"
    t.integer  "amount"
    t.float    "markup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.integer  "order_id"
    t.string   "status"
    t.string   "name"
    t.string   "description"
    t.string   "alternate_name"
    t.boolean  "include_section_on_quote"
    t.boolean  "current_order"
    t.string   "ink_coverage"
    t.boolean  "bleeds"
    t.integer  "ink_side_1"
    t.string   "ink_side_1_colors"
    t.integer  "ink_side_2"
    t.string   "ink_side_2_colors"
    t.integer  "paper_stock_id"
    t.text     "stock_description"
    t.boolean  "customer_supplied_stock"
    t.integer  "press_id"
    t.string   "parent_size"
    t.string   "press_size"
    t.integer  "out"
    t.integer  "signature"
    t.integer  "pages"
    t.string   "layout"
    t.float    "stock_sell_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taggings", :force => true do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string  "taggable_type"
    t.integer "user_id"
  end

  add_index "taggings", ["tag_id", "taggable_type", "user_id"], :name => "index_taggings_on_user_id_and_tag_id_and_taggable_type"
  add_index "taggings", ["tag_id", "taggable_type"], :name => "index_taggings_on_tag_id_and_taggable_type"
  add_index "taggings", ["taggable_id", "taggable_type", "user_id"], :name => "index_taggings_on_user_id_and_taggable_id_and_taggable_type"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0, :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"
  add_index "tags", ["taggings_count"], :name => "index_tags_on_taggings_count"

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.string   "permissions"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups_users", :id => false, :force => true do |t|
    t.integer "user_group_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.integer  "company_id"
    t.string   "login"
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
