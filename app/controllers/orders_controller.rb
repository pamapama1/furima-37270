class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :sold_out, only: [:index]

  def index
    if @item.user_id == current_user.id
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :municipalities, :location_id, :address, :building, :tel_number).merge(
      user_id: current_user.id, item_id: params[:item_id].to_i, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
