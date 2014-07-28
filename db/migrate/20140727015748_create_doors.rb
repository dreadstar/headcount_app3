class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.integer :location_id
      t.boolean :is_external
      t.integer :flow_to
      t.integer :flow_from
      t.string  :name
      t.string  :sensor_id
      t.integer :current_state

      t.timestamps
    end
  end
end
