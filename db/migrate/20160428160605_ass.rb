class Ass < ActiveRecord::Migration
  def change
  	add_column("products", "city", :integer)
  end
end
