class AddShoppingCartIdToUser < ActiveRecord::Migration
  def up
  	add_column("users", "shopping_cart_id", :integer)
  	add_index("users", "shopping_cart_id")
  end

  def down
  	remove_index("users", "shopping_cart_id")
  	remove_column("users", "shopping_cart_id")
  end
end
