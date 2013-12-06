class AddUStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :u_state, :string
  end
end
