class Customers::ItemsController < ApplicationController
 before_action :authenticate_customer!

 def index
  @items = Item.all
  @items_all = Item.all
 end

 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
 end

 def item_params
  params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active)
 end
 
end