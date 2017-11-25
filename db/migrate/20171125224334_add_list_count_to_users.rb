class AddListCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lists_count, :integer
  end
end
