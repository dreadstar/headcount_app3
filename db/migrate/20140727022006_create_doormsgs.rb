class CreateDoormsgs < ActiveRecord::Migration
  def change
    create_table :doormsgs do |t|
      t.integer :door_id
      t.datetime :tstamp
      t.text :msg
      t.integer :counter_state
      t.string :ip_addr
      t.string :sensor_id

      t.timestamps
    end
  end
end
