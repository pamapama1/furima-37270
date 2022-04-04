class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
before_action :set_item, only: [ :index,:create]
before_action :sold_out, only: [ :index]

  def index
    #@item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  

  def create
    #@user = User.find(current_user.id)
   @order_address = OrderAddress.new(order_params)
  # @address = Address.new(address_params)
  if @order_address.valid?
   pay_item
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

    def sold_out
    if @item.order.present?
     redirect_to root_path
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:post_code, :municipalities ,:location_id, :address, :building , :tel_number).merge(user_id: current_user.id ,item_id: params[:item_id].to_i , token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  

 

end
