class RenameUStateToUParent < ActiveRecord::Migration
  def change
    rename_column :users, :u_state, :u_parent
  end
end
