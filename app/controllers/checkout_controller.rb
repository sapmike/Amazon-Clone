class CheckoutController < ApplicationController


  def create
    @session = Stripe::Checkout::Session.create({

    shipping_address_collection: {
    allowed_countries: ['US', 'CA'],
    },
    shipping_options: [
    {
      shipping_rate_data: {
        type: 'fixed_amount',
        fixed_amount: {
          amount: 0,
          currency: 'usd',
        },
        display_name: 'Free shipping',
        # Delivers between 5-7 business days
        delivery_estimate: {
          minimum: {
            unit: 'business_day',
            value: 5,
          },
          maximum: {
            unit: 'business_day',
            value: 7,
          },
        }
      }
    },
    {
      shipping_rate_data: {
        type: 'fixed_amount',
        fixed_amount: {
          amount: 1500,
          currency: 'usd',
        },
        display_name: 'Next day air',
        # Delivers in exactly 1 business day
        delivery_estimate: {
          minimum: {
            unit: 'business_day',
            value: 1,
          },
          maximum: {
            unit: 'business_day',
            value: 1,
          },
        }
      }
    },
    ],
      client_reference_id: current_user.id,
      success_url: root_url,
      cancel_url: cart_url,
      payment_method_types: ['card'],
      line_items: [
          name: "Best Samples Ever",
          amount: (current_order.subtotal * 100).to_i,
          currency: "usd",
          quantity: 1,
      ],
      mode: 'payment',
      metadata: {product_id: params[:product_id]},
      customer_email: current_user.email,
    })

#   respond_to do |format|
#      format.js
#    end
    redirect_to @session.url, allow_other_host: true
  end
end
