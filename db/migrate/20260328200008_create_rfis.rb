class CreateRfis < ActiveRecord::Migration[6.1]
  def change
create_table "rfis", force: :cascade do |t|
    t.string "pname"
    t.string "location"
    t.string "number"
    t.date "date"
    t.string "pid"
    t.string "drawing"
    t.string "overview"
    t.string "referenced"
    t.integer "nochange1"
    t.integer "nochange2"
    t.decimal "increase_cost"
    t.integer "increase_time"
    t.decimal "decrease_cost"
    t.integer "decrease_time"
    t.string "request"
    t.string "name_request"
    t.string "signature1"
    t.string "signature2"
    t.string "response"
    t.date "date2"
    t.integer "status"
    t.string "name_responding"
    t.string "cname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "select1"
    t.integer "select2"
    t.integer "select3"
    t.integer "select4"
    t.integer "select5"
    t.integer "select6"
    t.bigint "estimateds_id"
    t.index ["estimateds_id"], name: "index_rfis_on_estimateds_id"
  end
  end
end
