class CreateChangeOrders < ActiveRecord::Migration[6.1]
  def change
create_table "change_orders", force: :cascade do |t|
    t.string "cname"
    t.string "address"
    t.string "phone"
    t.date "date"
    t.string "commit"
    t.string "job"
    t.string "email"
    t.string "vendor"
    t.string "code"
    t.string "job_site"
    t.decimal "Contract"
    t.decimal "corder1"
    t.decimal "corder2"
    t.decimal "corder3"
    t.decimal "corder4"
    t.decimal "corder5"
    t.decimal "total"
    t.string "description"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cost_sheet_id"
    t.integer "count_number"
    t.integer "daily_number"
    t.decimal "cost"
    t.string "mdefault1"
    t.string "mdescription1"
    t.decimal "mtotal1"
    t.string "mdefault2"
    t.string "mdescription2"
    t.decimal "mtotal2"
    t.string "mdefault3"
    t.string "mdescription3"
    t.decimal "mtotal3"
    t.index ["cost_sheet_id"], name: "index_change_orders_on_cost_sheet_id"
  end
  end
end
