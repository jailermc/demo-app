class CreateTemplateUploads < ActiveRecord::Migration[6.1]
  def change
create_table "template_uploads", force: :cascade do |t|
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  end
end
