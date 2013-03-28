# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130228000056) do

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "r_min"
    t.integer  "l_min"
    t.integer  "g_min"
    t.integer  "s_min"
    t.text     "phrase"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.integer  "total_r_min"
    t.integer  "total_l_min"
    t.integer  "total_g_min"
    t.integer  "total_s_min"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
