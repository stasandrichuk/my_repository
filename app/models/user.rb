require 'pry'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def cart_count
  	if self.shopping_cart_id.blank?
  	  shopping_cart = ShoppingCart.create
      self.update_attribute(:shopping_cart_id, shopping_cart.id)
    end
    self.shopping_cart.total_unique_items
  end  
  belongs_to :shopping_cart

  cattr_accessor :cuser
end
