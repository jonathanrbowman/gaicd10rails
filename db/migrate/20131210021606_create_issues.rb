class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.integer :user_id
      t.boolean :status, :default => false
      t.string :i_state

      t.timestamps
    end
    add_index :issues, :user_id
  end
end
