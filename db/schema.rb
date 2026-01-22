# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_21_174609) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "friend_wanted_posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "introduction"
    t.text "target_game_ids"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_friend_wanted_posts_on_user_id"
  end

  create_table "game_modes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_title_id", null: false
    t.integer "max_players"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["game_title_id"], name: "index_game_modes_on_game_title_id"
  end

  create_table "game_role_opponents_post_relations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_role_id", null: false
    t.integer "opponents_wanted_post_id", null: false
    t.datetime "updated_at", null: false
    t.index ["game_role_id"], name: "index_game_role_opponents_post_relations_on_game_role_id"
    t.index ["opponents_wanted_post_id"], name: "idx_on_opponents_wanted_post_id_16bfd8a9dd"
  end

  create_table "game_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_title_id", null: false
    t.string "name"
    t.string "role_type"
    t.datetime "updated_at", null: false
    t.index ["game_title_id"], name: "index_game_roles_on_game_title_id"
  end

  create_table "game_titles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "gamemodes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_title_id", null: false
    t.integer "max_players"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["game_title_id"], name: "index_gamemodes_on_game_title_id"
  end

  create_table "opponents_wanted_posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "current_need_num"
    t.text "description"
    t.integer "game_mode_id", null: false
    t.integer "game_title_id", null: false
    t.integer "need_num"
    t.datetime "start_time"
    t.boolean "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "voice_chat"
    t.index ["game_mode_id"], name: "index_opponents_wanted_posts_on_game_mode_id"
    t.index ["game_title_id"], name: "index_opponents_wanted_posts_on_game_title_id"
    t.index ["user_id"], name: "index_opponents_wanted_posts_on_user_id"
  end

  create_table "user_game_relations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_mode_2_id"
    t.integer "game_mode_id"
    t.integer "game_role_2_id"
    t.integer "game_role_3_id"
    t.integer "game_role_id"
    t.integer "game_title_id", null: false
    t.integer "play_style"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["game_mode_2_id"], name: "index_user_game_relations_on_game_mode_2_id"
    t.index ["game_mode_id"], name: "index_user_game_relations_on_game_mode_id"
    t.index ["game_role_2_id"], name: "index_user_game_relations_on_game_role_2_id"
    t.index ["game_role_3_id"], name: "index_user_game_relations_on_game_role_3_id"
    t.index ["game_role_id"], name: "index_user_game_relations_on_game_role_id"
    t.index ["game_title_id"], name: "index_user_game_relations_on_game_title_id"
    t.index ["user_id"], name: "index_user_game_relations_on_user_id"
  end

  create_table "user_opponents_post_relations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "opponents_wanted_post_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["opponents_wanted_post_id"], name: "idx_on_opponents_wanted_post_id_502736396c"
    t.index ["user_id"], name: "index_user_opponents_post_relations_on_user_id"
  end

  create_table "usergamerelations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_mode_id", null: false
    t.integer "game_role_id", null: false
    t.integer "game_title_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["game_mode_id"], name: "index_usergamerelations_on_game_mode_id"
    t.index ["game_role_id"], name: "index_usergamerelations_on_game_role_id"
    t.index ["game_title_id"], name: "index_usergamerelations_on_game_title_id"
    t.index ["user_id"], name: "index_usergamerelations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "gender"
    t.text "introduction"
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "friend_wanted_posts", "users"
  add_foreign_key "game_modes", "game_titles"
  add_foreign_key "game_role_opponents_post_relations", "game_roles"
  add_foreign_key "game_role_opponents_post_relations", "opponents_wanted_posts"
  add_foreign_key "game_roles", "game_titles"
  add_foreign_key "gamemodes", "game_titles"
  add_foreign_key "opponents_wanted_posts", "game_modes"
  add_foreign_key "opponents_wanted_posts", "game_titles"
  add_foreign_key "opponents_wanted_posts", "users"
  add_foreign_key "user_game_relations", "game_modes"
  add_foreign_key "user_game_relations", "game_modes", column: "game_mode_2_id"
  add_foreign_key "user_game_relations", "game_roles"
  add_foreign_key "user_game_relations", "game_roles", column: "game_role_2_id"
  add_foreign_key "user_game_relations", "game_roles", column: "game_role_3_id"
  add_foreign_key "user_game_relations", "game_titles"
  add_foreign_key "user_game_relations", "users"
  add_foreign_key "user_opponents_post_relations", "opponents_wanted_posts"
  add_foreign_key "user_opponents_post_relations", "users"
  add_foreign_key "usergamerelations", "game_modes"
  add_foreign_key "usergamerelations", "game_roles"
  add_foreign_key "usergamerelations", "game_titles"
  add_foreign_key "usergamerelations", "users"
end
