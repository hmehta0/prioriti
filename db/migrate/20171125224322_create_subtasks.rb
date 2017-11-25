class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :subtaskname
      t.string :subtaskprioriti
      t.datetime :subtaskduedate
      t.string :subtaskstatus
      t.integer :task_id

      t.timestamps

    end
  end
end
