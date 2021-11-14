class Customers::ItemsController < ApplicationController
 before_action :authenticate_customer!

 def index
  # @genres = Genre.all
  # @search = Item.ransack(params[:q])
  # @items = @search.result.page(params[:page]).per(8)
  @items = Item.all
  @items_all = Item.all
 end

 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
  #@genres = Genre.all
 end
end
