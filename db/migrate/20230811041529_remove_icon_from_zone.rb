class RemoveIconFromZone < ActiveRecord::Migration[7.0]
  def change
    remove_column :zones, :icon, :string
  end
end
