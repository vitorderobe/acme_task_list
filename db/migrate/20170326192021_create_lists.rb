class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false, default: ""
      t.boolean :private, default: false
      t.boolean :done, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :lists, [:user_id, :created_at]
  end
end
