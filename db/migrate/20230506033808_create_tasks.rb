class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :zone, null: false, foreign_key: true
      t.integer :inspection_period
      t.datetime :inspected_on
      t.integer :snooze_duration
      t.datetime :snoozed_on

      t.timestamps
    end
  end
end
