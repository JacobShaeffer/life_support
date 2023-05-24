class ChangeValueToString < ActiveRecord::Migration[7.0]
  def change
		change_column :configs, :value, :string
  end
end
