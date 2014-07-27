class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :owner_id
      t.string :name
      t.integer :max_capacity
      t.string :yelp_url
      t.string :site_url
      t.integer :current_state

      t.timestamps
    end
  end
end
