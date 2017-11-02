class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :body, null: false
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
