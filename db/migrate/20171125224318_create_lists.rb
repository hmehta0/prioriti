class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :listname
      t.string :listtype
      t.string :listprioriti
      t.datetime :listduedate
      t.string :liststatus
      t.integer :user_id

      t.timestamps

    end
  end
end
