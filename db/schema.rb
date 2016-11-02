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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161028092409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "answer_file"
    t.index ["lesson_id"], name: "index_answers_on_lesson_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "short_description"
    t.integer  "teacher_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "avatar"
  end

  create_table "homeworks", force: :cascade do |t|
    t.text     "content"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_homeworks_on_lesson_id", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.text     "short_description"
    t.integer  "course_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "video_url",         default: ""
    t.boolean  "homework",          default: false
    t.index ["course_id", "created_at"], name: "index_lessons_on_course_id_and_created_at", using: :btree
    t.index ["course_id"], name: "index_lessons_on_course_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "student_id"], name: "index_relationships_on_course_id_and_student_id", unique: true, using: :btree
    t.index ["course_id"], name: "index_relationships_on_course_id", using: :btree
    t.index ["student_id"], name: "index_relationships_on_student_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "avatar"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false
    t.boolean  "teacher",                default: false
    t.boolean  "student",                default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.integer  "lesson_id"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_videos_on_lesson_id", using: :btree
  end

  add_foreign_key "homeworks", "lessons"
  add_foreign_key "lessons", "courses"
end
