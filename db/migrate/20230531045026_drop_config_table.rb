class DropConfigTable < ActiveRecord::Migration[7.0]
  def change
		drop_table :configs
  end
end
