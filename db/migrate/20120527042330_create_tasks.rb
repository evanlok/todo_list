class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :completed, :default => false
      t.integer :list_id

      t.timestamps
    end
  end
end
