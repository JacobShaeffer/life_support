class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.references :zone, foreign_key: true

      t.timestamps
    end
  end
end
