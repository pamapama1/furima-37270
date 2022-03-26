class OrdersController < ApplicationController
  def index
   # @order = Order.create(order_params)
    @item = Item.find(params[:item_id])
#@order = Order.new
  end

  def create
    @order = Order.create(order_params)
    @item = Item.find(params[:item_id])
    #@oder = @item.oders.new(oder_params)
    Address.create(address_params)
 
   # if @order.valid?
    #  @order.save
     # return redirect_to root_path
    #else
     # render 'index'
    #end
  end


  private

  def order_params
    params.require(:item).permit(:image, :name, :price ,:delivery_charge).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:post_code, :municipalities, :location_id, :address, :building, :tel_number).merge(order_id: @order.id)
  end
  def item_params
    params.require(:item).permit(:image, :name, :category_id, :status_id, :delivery_charge_id, :location_id, :delivery_date_id,
                                 :description, :price).merge(user_id: current_user.id)
  end

end
