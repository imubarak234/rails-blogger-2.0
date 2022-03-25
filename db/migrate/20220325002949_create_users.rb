class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.string "name"
      t.string "photo"
      t.text "Bio"
      t.timestamps
      t.integer "posts_counter"
    end
  end
end
