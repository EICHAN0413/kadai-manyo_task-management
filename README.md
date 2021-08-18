 ActiveRecord::Schema.define(version: 2021_08_17_022353) do -->

 enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|

    t.string "title", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

  end


<<<<<<< HEAD
end
=======
end
>>>>>>> 2ad20250d0f972d5e4b2978ec375bf8c0adb28c4
