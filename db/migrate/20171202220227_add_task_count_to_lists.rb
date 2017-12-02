class AddTaskCountToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :tasks_count, :integer
  end
end
