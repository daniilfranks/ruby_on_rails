class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :img
      t.boolean :publication, default: false

      t.timestamps
    end
    add_index :posts, :title, unique: true
  end
end
