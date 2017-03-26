class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :description, null: false, default: ""
      t.boolean :done, default: false
      t.references :list, foreign_key: true

      t.timestamps
    end
    add_index :tasks, [:list_id, :created_at]
  end
end
