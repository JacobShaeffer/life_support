class AddIconAndAlertToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :icon, :string
    add_column :tasks, :alert, :integer
  end
end
