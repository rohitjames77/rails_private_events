

ActiveRecord::Schema[8.1].define(version: 2026_02_08_122406) do
  enable_extension "pg_catalog.plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "attended_event_id", null: false
    t.bigint "attendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attended_event_id"], name: "index_attendances_on_attended_event_id"
    t.index ["attendee_id"], name: "index_attendances_on_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "creator_id"
    t.date "date_of_event"
    t.string "event_name"
    t.string "location"
    t.integer "no_of_attendence"
    t.integer "ticket_price"
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "events", column: "attended_event_id"
  add_foreign_key "attendances", "users", column: "attendee_id"
  add_foreign_key "events", "users", column: "creator_id"
end
