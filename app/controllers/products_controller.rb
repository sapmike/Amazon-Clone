class ProductsController < ApplicationController

  # before_action :require_user, only:[:index, :show]   <-- Do not want to restict users from viewing page without account.


  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where("title LIKE ?" ,"%" + params[:q] + "%")
  end


end
