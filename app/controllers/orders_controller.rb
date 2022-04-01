class OrdersController < ApplicationController

before_action :set_item, only: [ :index]

  def index
    #@item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  

  def create

    #@user = User.find(current_user.id)
   @order_address = OrderAddress.new(order_params)
  # @address = Address.new(address_params)
  if @order_address.valid?
    @order_address.save  # バリデーションをクリアした時
    redirect_to root_path
  else
    @item = Item.find(params[:item_id])
    render :index   # バリデーションに弾かれた時
   
  end
    #if @order.save
    #redirect_to root_path
    #else
    #render :index
    #end
  end


  def set_item
    @item = Item.find(params[:item_id])
  end


  private

 # def item_params
  #  params.require(:item).permit(:image, :name, :category_id, :status_id, :delivery_charge_id, :location_id, :delivery_date_id,
   #                              :description, :price).merge(user_id: current_user.id)
  #end

  def order_params
    params.require(:order_address).permit(:post_code, :municipalities ,:location_id, :address, :building , :tel_number).merge(user_id: current_user.id ,item_id: params[:item_id].to_i)
  end

 

end
