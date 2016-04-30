class AddLatlngToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :latitude, :decimal, precision: 10, scale: 7, default: -39.0392
  	add_column :users, :longitude, :decimal, precision: 10, scale: 7, default: 125.7625
  end

  def down
  	remove_column :users, :latitude
  	remove_column :users, :longitude
  end
end
