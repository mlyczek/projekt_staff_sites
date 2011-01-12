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

ActiveRecord::Schema.define(:version => 20110112084910) do

  create_table "consultations", :force => true do |t|
    t.string  "day"
    t.time    "start"
    t.time    "end"
    t.text    "comments"
    t.integer "teacher_id"
  end

  create_table "facebooks", :force => true do |t|
    t.string  "profile_id"
    t.string  "profile_url"
    t.string  "access_token"
    t.integer "teacher_id"
  end

  create_table "profiles", :force => true do |t|
    t.integer "teacher_id"
    t.string  "name"
    t.string  "degree"
    t.integer "room_nr"
    t.string  "phone"
  end

  create_table "publications", :force => true do |t|
    t.integer "teacher_id"
    t.string  "co_authors"
    t.string  "title"
    t.integer "year"
    t.string  "link"
  end

  create_table "subjects", :force => true do |t|
    t.integer "teacher_id"
    t.string  "name"
    t.string  "academic_year"
    t.string  "semester"
  end

  create_table "teachers", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
  end

  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true
  add_index "teachers", ["login"], :name => "index_teachers_on_login", :unique => true
  add_index "teachers", ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true

end
