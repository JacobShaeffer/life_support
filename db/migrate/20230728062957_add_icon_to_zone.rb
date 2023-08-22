class AddIconToZone < ActiveRecord::Migration[7.0]
  def change
    add_column :zones, :icon, :string
		remove_column :tasks, :icon
  end
end
