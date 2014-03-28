class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user_id, null: false
      t.string :category, null: false
      t.string :body, null: false
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
