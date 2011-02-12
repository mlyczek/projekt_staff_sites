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

ActiveRecord::Schema.define(:version => 20110212195521) do

  create_table "consultations", :force => true do |t|
    t.string  "day"
    t.time    "start"
    t.time    "end"
    t.text    "comments"
    t.integer "teacher_id"
  end

  create_table "event_type_colors", :force => true do |t|
    t.string "name"
    t.string "css_class"
  end

  create_table "event_types", :force => true do |t|
    t.string  "name"
    t.integer "event_type_color_id", :limit => 255
    t.boolean "editable",                           :default => true
    t.integer "timetable_id"
  end

  create_table "events", :force => true do |t|
    t.integer "timetable_id"
    t.integer "event_type_id"
    t.string  "title"
    t.string  "week_day"
    t.text    "description"
    t.time    "start"
    t.time    "end"
    t.boolean "editable",      :default => true
  end

  create_table "exercises_lists", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "nr"
    t.date     "deadline"
    t.integer  "exercises_files_list_id"
    t.string   "url"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises_lists_files", :force => true do |t|
    t.integer  "exercises_list_id"
    t.string   "file_name"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebooks", :force => true do |t|
    t.string  "profile_id"
    t.string  "profile_url"
    t.string  "access_token"
    t.integer "teacher_id"
  end

  create_table "hours", :force => true do |t|
    t.integer "subject_id"
    t.string  "genre"
    t.string  "week_day"
    t.time    "start"
    t.time    "end"
    t.string  "room"
  end

  create_table "lecture_resources", :force => true do |t|
    t.integer "lecture_id"
    t.string  "url"
    t.string  "description"
    t.string  "name"
  end

  create_table "lectures", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "nr"
    t.string   "title"
    t.date     "date"
    t.text     "abstract"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "timetables", :force => true do |t|
    t.integer  "teacher_id"
    t.string   "comment"
    t.datetime "modified"
  end

end
