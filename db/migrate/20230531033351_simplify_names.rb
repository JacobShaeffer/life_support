class SimplifyNames < ActiveRecord::Migration[7.0]
  def change
		add_column :zones, :name, :string
		remove_column :zones, :name_basic
		remove_column :zones, :name_fantasy
		remove_column :zones, :name_scifi

		remove_column :tasks, :name_basic
		remove_column :tasks, :name_fantasy
		remove_column :tasks, :name_scifi
  end
end
