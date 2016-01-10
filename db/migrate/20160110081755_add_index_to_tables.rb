class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :logs, :task_id
    add_index :tasks, :user_id
  end
end
