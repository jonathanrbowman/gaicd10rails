class RenameTStateToTParent < ActiveRecord::Migration
  def change
    rename_column :tasks, :t_state, :t_parent
  end
end
