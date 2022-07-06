class CartController < ApplicationController

#requires user to have an account and be signed in to be able to add to cart
before_action :require_user, only:[:show]

  def show
    @order_items = current_order.order_items
  end
end
