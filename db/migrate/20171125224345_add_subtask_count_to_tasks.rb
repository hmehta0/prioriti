class AddSubtaskCountToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :subtasks_count, :integer
  end
end
