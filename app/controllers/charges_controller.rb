class ChargesController < ApplicationController
	before_action :authenticate_user!

	def index
		@total = params[:total]
	end

	def new
		# this will remain empty unless you need to set some instance variables to pass on
	end

	def create
    	# Amount in cents
    	amount = (params[:stripeAmount].to_f * 100).to_i
	    # Create the customer in Stripe
	    customer = Stripe::Customer.create(
	    	email: params[:stripeEmail],
	    	card: params[:stripeToken]
	    )

	    # Create the charge using the customer data returned by Stripe API
	    charge = Stripe::Charge.create(
	    	customer: customer.id,
	    	amount: amount,
	    	description: 'Rails Stripe customer',
	    	currency: 'usd'
	    )

	current_user.shopping_cart.clear
	redirect_to root_path

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to charges_path
		flash[:notice] = "Please try again"
	end
end
