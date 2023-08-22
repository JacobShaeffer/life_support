class AddIconToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :icon, :string
  end
end
