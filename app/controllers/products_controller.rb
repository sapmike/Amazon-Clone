class ProductsController < ApplicationController
  before_action :require_user, only:[:index, :show]


  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

end
