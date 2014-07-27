class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :location_id
      t.string :name
      t.integer :current_state
      t.integer :max_capacity

      t.timestamps
    end
  end
end
