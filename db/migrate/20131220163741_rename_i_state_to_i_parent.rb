class RenameIStateToIParent < ActiveRecord::Migration
  def change
    rename_column :issues, :i_state, :i_parent
  end
end
