class CreateJoinTablePostsUser < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :users, table_name: :like do |t|
    t.index [:post_id, :user_id]
    t.index [:user_id, :post_id]
    t.timestamps
    end
  end
end
