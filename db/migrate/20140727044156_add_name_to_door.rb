class AddNameToDoor < ActiveRecord::Migration
  def change
    add_column :doors, :name, :string
  end
end
