class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :type
      t.text :body
      t.string :title
      t.references :user
      t.references :post

      t.timestamps
    end
  end
end
