class RenameStepColumn < ActiveRecord::Migration
  def change
    rename_column :tasks, :step, :position
  end
end
