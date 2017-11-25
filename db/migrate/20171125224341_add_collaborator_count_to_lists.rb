class AddCollaboratorCountToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :collaborators_count, :integer
  end
end
