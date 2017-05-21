class CreateCompletions < ActiveRecord::Migration[5.0]
  def change
    create_table :completions do |t|
      t.references :task, null: false, foreign_key: true
      t.timestamp :completed_at, null: false
      t.timestamps
    end
  end
end
