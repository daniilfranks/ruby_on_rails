class CreateCategoryHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :category_homeworks do |t|
      t.references :category, foreign_key: true
      t.references :homework, foreign_key: true

      t.timestamps
    end
  end
end
