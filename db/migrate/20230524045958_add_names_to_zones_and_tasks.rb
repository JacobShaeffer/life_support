class AddNamesToZonesAndTasks < ActiveRecord::Migration[7.0]
  def change
		add_column :tasks, :name_basic, :string
		add_column :tasks, :name_fantasy, :string
		add_column :tasks, :name_scifi, :string

		add_column :zones, :name_basic, :string
		add_column :zones, :name_fantasy, :string
		add_column :zones, :name_scifi, :string
  end
end
