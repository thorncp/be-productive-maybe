class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.string :description, null: false
    end
  end
end
