class OrderItemsController < ApplicationController
  before_action :set_order

  protect_from_forgery with: :null_session


#    def index
#      @user = current_user
#      @order_item = @user.order_items
#    end


  def create
#    @user = User.find(params[:id]
    @order_item = @order.order_items.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = current_order.order_items
    redirect_to cart_path
    flash[:notice] = "Shopping cart was successfully updated"
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
    redirect_to cart_path
    flash[:alert] = "Shopping cart was deleted"
  end


private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
