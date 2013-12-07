class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :p_fname, :string
    add_column :users, :p_lname, :string
    add_column :users, :p_phone, :string
    add_column :users, :s_fname, :string
    add_column :users, :s_lname, :string
    add_column :users, :s_email, :string
    add_column :users, :s_phone, :string
  end
end