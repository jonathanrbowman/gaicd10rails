class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :step
      t.string :title
      t.text :description
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
