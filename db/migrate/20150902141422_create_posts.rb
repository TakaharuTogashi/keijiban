class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :email
      t.text :comment, null: false

      t.timestamps null: false
    end
  end
end
