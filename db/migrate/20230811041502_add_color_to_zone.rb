class AddColorToZone < ActiveRecord::Migration[7.0]
  def change
    add_column :zones, :color, :string
  end
end
