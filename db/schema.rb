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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150511010917) do

  create_table "app_infos", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "profile_id"
    t.string   "acc_or_rej"
    t.integer  "professer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "app_infos", ["plan_id"], name: "index_app_infos_on_plan_id"
  add_index "app_infos", ["professer_id"], name: "index_app_infos_on_professer_id"
  add_index "app_infos", ["profile_id"], name: "index_app_infos_on_profile_id"

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "post_id"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["profile_id"], name: "index_comments_on_profile_id"

  create_table "degrees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "friendables", force: :cascade do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes"

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type"

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions"

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "event_type"
    t.integer  "event_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_follows", force: :cascade do |t|
    t.string   "folowee_type"
    t.integer  "folowee_id"
    t.string   "folower_type"
    t.integer  "folower_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer  "uni_id"
    t.integer  "degree_id"
    t.integer  "field_id"
    t.integer  "semester_id"
    t.string   "min_toefl"
    t.string   "min_GRE"
    t.date     "deadline"
    t.integer  "app_fee"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "plans", ["degree_id"], name: "index_plans_on_degree_id"
  add_index "plans", ["field_id"], name: "index_plans_on_field_id"
  add_index "plans", ["semester_id"], name: "index_plans_on_semester_id"
  add_index "plans", ["uni_id"], name: "index_plans_on_uni_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ancestry"
    t.string   "postable_type"
    t.integer  "postable_id"
  end

  add_index "posts", ["ancestry"], name: "index_posts_on_ancestry"

  create_table "professers", force: :cascade do |t|
    t.string   "name"
    t.integer  "uni_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "professers", ["uni_id"], name: "index_professers_on_uni_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "age"
    t.string   "universityName"
    t.string   "previews"
    t.string   "currentUni"
    t.string   "phoneNumber"
    t.string   "name"
    t.string   "familyName"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.date     "date_of_birth"
    t.string   "Job"
    t.string   "Gender"
    t.string   "country"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "semesters", force: :cascade do |t|
    t.date     "semester_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "unis", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
