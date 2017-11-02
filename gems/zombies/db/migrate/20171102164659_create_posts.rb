class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.boolean :publishing, default: false
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
