class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
create_table "employees", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "lastname"
    t.string "phone"
    t.string "active"
    t.bigint "cost_sheet_id"
    t.integer "function"
    t.integer "project"
    t.integer "active1"
    t.index ["cost_sheet_id"], name: "index_employees_on_cost_sheet_id"
  end
  end
end
