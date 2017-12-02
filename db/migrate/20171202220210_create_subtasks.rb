class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :name
      t.string :prioriti
      t.datetime :duedate
      t.string :status
      t.integer :task_id

      t.timestamps

    end
  end
end
