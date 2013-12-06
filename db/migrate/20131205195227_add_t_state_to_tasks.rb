class AddTStateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :t_state, :string
  end
end
