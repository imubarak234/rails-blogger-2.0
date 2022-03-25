class AddNameToPosts < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.rename :users_id, :authorid
    end
    change_table :comment do |t|
      t.rename :user_id, :authorid
    end
    change_table :like do |t|
      t.rename :user_id, :authorid
    end
  end
end
