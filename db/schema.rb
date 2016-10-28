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

ActiveRecord::Schema.define(version: 20161027121008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "homework_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "answer_file"
    t.integer  "points",      default: 0
    t.text     "comment",     default: ""
    t.index ["homework_id"], name: "index_answers_on_homework_id", using: :btree
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
    t.string   "title"
    t.text     "short_description"
    t.integer  "points"
    t.integer  "course_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["course_id"], name: "index_homeworks_on_course_id", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.text     "short_description"
    t.integer  "course_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "video_url",         default: ""
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
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.boolean  "teacher",         default: false
    t.boolean  "student",         default: false
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.integer  "lesson_id"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_videos_on_lesson_id", using: :btree
  end

  add_foreign_key "homeworks", "courses"
  add_foreign_key "lessons", "courses"
end
