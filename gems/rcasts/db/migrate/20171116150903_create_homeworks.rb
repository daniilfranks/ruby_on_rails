class CreateHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :homeworks do |t|
      t.string :name
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
