class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :status
      t.string :message
      t.references :task

      t.timestamps null: false
    end
  end
end
