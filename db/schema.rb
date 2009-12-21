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

ActiveRecord::Schema.define(:version => 20091221060842) do

  create_table "districts", :primary_key => "gid", :force => true do |t|
    t.column "state", :string, :limit => 2
    t.column "cd", :string, :limit => 3
    t.column "lsad", :string, :limit => 2
    t.column "name", :string, :limit => 90
    t.column "lsad_trans", :string, :limit => 50
    t.column "the_geom", :multi_polygon
    t.column "state_name", :string
    t.column "level", :string
    t.column "census_geo_id", :string
  end

  add_index "districts", ["the_geom"], :name => "index_districts_on_the_geom", :spatial=> true 

  create_table "legislators", :force => true do |t|
    t.column "chamber", :string
    t.column "session", :string
    t.column "first_name", :string
    t.column "middle_name", :string
    t.column "last_name", :string
    t.column "suffix", :string
    t.column "party", :string
    t.column "district", :string
    t.column "phone_number", :string
    t.column "fax_number", :string
    t.column "email_address", :string
    t.column "created_at", :timestamp
    t.column "updated_at", :timestamp
  end

  create_table "lower_districts", :primary_key => "gid", :force => true do |t|
    t.column "state", :string, :limit => 2
    t.column "sldl", :string, :limit => 3
    t.column "name", :string, :limit => 90
    t.column "lsad", :string, :limit => 2
    t.column "geo_id", :string, :limit => 12
    t.column "lsad_trans", :string, :limit => 50
    t.column "the_geom", :multi_polygon
  end

  create_table "upper_districts", :primary_key => "gid", :force => true do |t|
    t.column "state", :string, :limit => 2
    t.column "sldu", :string, :limit => 3
    t.column "name", :string, :limit => 90
    t.column "lsad", :string, :limit => 2
    t.column "geo_id", :string, :limit => 12
    t.column "lsad_trans", :string, :limit => 50
    t.column "the_geom", :multi_polygon
  end

end
