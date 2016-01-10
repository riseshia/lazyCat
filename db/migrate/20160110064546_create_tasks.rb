class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :token
      t.integer :period
      t.references :user

      t.timestamps null: false
    end
    add_index :tasks, :name
  end
end
