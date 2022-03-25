class CreateJoinTableUserPosts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :user, :posts, table_name: :comment do |t|
      t.index [:user_id, :post_id]
      t.index [:post_id, :user_id]
      t.timestamps
      t.string "text"
    end
  end
end
