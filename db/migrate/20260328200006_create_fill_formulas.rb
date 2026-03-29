class CreateFillFormulas < ActiveRecord::Migration[6.1]
  def change
create_table "fill_formulas", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  end
end
