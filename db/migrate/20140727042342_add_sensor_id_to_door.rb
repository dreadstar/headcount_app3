class AddSensorIdToDoor < ActiveRecord::Migration
  def change
    add_column :doors, :sensor_id, :string
  end
end
