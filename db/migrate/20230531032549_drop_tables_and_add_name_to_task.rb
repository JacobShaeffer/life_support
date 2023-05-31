class DropTablesAndAddNameToTask < ActiveRecord::Migration[7.0]
  def change
		add_column :tasks, :name, :string
		drop_table :names
		drop_table :themes
  end
end
