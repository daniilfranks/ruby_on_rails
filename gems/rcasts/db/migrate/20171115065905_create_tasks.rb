class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :complete, default: false
      t.integer :priority, default: 3
      t.integer :position, default: 0
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :tasks, :title, unique: true
  end
end
