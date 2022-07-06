class ProductsController < ApplicationController

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end

  def search
    @products = Product.where("title LIKE ?" ,"%" + params[:q] + "%")
  end
end
