class ChargesController < ApplicationController

	# def new
	# end

	def create
  	  # Amount in cents
	  # @amount = 500
	  product = Product.find_by_sku("PJB01")
	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :card  => params[:stripeToken],
	    :plan => "JOBBA"
	  )

	  # charge = Stripe::Charge.create(
	  #   :customer    => customer.id,
	  #   :amount      => product.price_in_cents,
	  #   :description => 'Post a Job',
	  #   :currency    => 'usd'
	  # )

	  purchase = Purchase.create(email: params[:stripeEmail],
	  	card: params[:stripeToken], amount: product.price_in_cents,
	  	description: product.description, currency: 'usd',
	  	customer_id: customer.id, product_id: product.id, uuid: SecureRandom.uuid)

	  redirect_to purchase

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end


 # purchase = Purchase.create(email: params[:stripeEmail],
	#   	card: params[:stripeToken], amount: product.price_in_cents,
	#   	description: charge.description, currency: 'charge.currency',
	#   	customer_id: customer.id, product_id: product.id, uuid: SecureRandom.uuid)