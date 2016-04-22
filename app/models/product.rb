class Product < ActiveRecord::Base
	# acts_as_shopping_cart_item_for :shopping_cart

	def poster
		"http://ia.media-imdb.com/images/M/#{poster_url}"
	end

	def imdb
		"http://www.imdb.com/title/#{imdb_id}/"
	end

	def cart_action(product_id)
		if User.cuser.present?
			if User.cuser.shopping_cart.shopping_cart_items.find_by_item_id(product_id)
				"Exist"
			else 
				"Add one to"
			end
		end
	end
end
