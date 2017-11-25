class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskname
      t.string :taskprioriti
      t.datetime :taskduedate
      t.string :taskstatus
      t.integer :list_id

      t.timestamps

    end
  end
end
