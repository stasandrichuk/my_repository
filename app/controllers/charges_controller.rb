class ChargesController < ApplicationController
	before_action :authenticate_user!

	def index
		@total = params[:total]
		if params[:gateway] == 'paypal'
			redirect_to charge_by_paypal_path
		end
	end

	def paypal
		
	end

	def stripe
    	# Amount in cents
    	amount = (params[:stripeAmount].to_f * 100).to_i
	    # Create the customer in Stripe
	    # binding.pry
	    # Stripe.api_key = "sk_test_GVmuEMsHReig7JJnNT73Qgnf"
	    Stripe.api_key = Rails.application.secrets.stripe_secret_key
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
