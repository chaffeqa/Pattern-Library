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

ActiveRecord::Schema.define(:version => 20100428172307) do

  create_table "accessibility_findings", :force => true do |t|
    t.integer  "pattern_id"
    t.text     "accessibility_finding"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accessibility_findings", ["pattern_id"], :name => "index_accessibility_findings_on_pattern_id"

  create_table "assigned_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assigned_groups", ["user_id", "group_id"], :name => "index_assigned_groups_on_user_id_and_group_id", :unique => true

  create_table "assigned_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assigned_roles", ["user_id", "role_id"], :name => "index_assigned_roles_on_user_id_and_role_id", :unique => true

  create_table "codes", :force => true do |t|
    t.integer  "pattern_id"
    t.string   "code_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "codes", ["pattern_id"], :name => "index_codes_on_pattern_id"

  create_table "edit_histories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pattern_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "edit_histories", ["user_id", "pattern_id"], :name => "index_edit_histories_on_user_id_and_pattern_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], :name => "index_groups_on_name"

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "parent_menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["name"], :name => "index_menus_on_name"
  add_index "menus", ["parent_menu_id"], :name => "index_menus_on_parent_menu_id"

  create_table "parent_menus", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parent_menus", ["name"], :name => "index_parent_menus_on_name"

  create_table "pattern_tags", :force => true do |t|
    t.integer  "pattern_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pattern_tags", ["pattern_id", "tag_id"], :name => "index_pattern_tags_on_pattern_id_and_tag_id", :unique => true

  create_table "patterns", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "when_to_use"
    t.text     "how_to_interact"
    t.text     "how_to_implement"
    t.text     "why_use"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "status"
    t.decimal  "rating_average_usefulness",  :precision => 6, :scale => 2, :default => 0.0
    t.decimal  "rating_average_description", :precision => 6, :scale => 2, :default => 0.0
  end

  add_index "patterns", ["name"], :name => "index_patterns_on_name", :unique => true
  add_index "patterns", ["status"], :name => "index_patterns_on_status"
  add_index "patterns", ["user_id"], :name => "index_patterns_on_user_id"

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "screenshots", :force => true do |t|
    t.integer  "pattern_id"
    t.string   "name"
    t.string   "content_type"
    t.binary   "data",            :limit => 307200
    t.string   "source"
    t.boolean  "pearson_product"
    t.boolean  "premier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "screenshots", ["pattern_id"], :name => "index_screenshots_on_pattern_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "submenus", :force => true do |t|
    t.integer  "pattern_id"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submenus", ["pattern_id", "menu_id"], :name => "index_submenus_on_pattern_id_and_menu_id", :unique => true

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "terms", :force => true do |t|
    t.string   "term"
    t.text     "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thumbnails", :force => true do |t|
    t.integer  "pattern_id"
    t.string   "source"
    t.binary   "data",       :limit => 51200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "thumbnails", ["pattern_id"], :name => "index_thumbnails_on_pattern_id"

  create_table "usability_findings", :force => true do |t|
    t.integer  "pattern_id"
    t.text     "usability_finding"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usability_findings", ["pattern_id"], :name => "index_usability_findings_on_pattern_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
