class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render 'items/new'

    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to controller: :items, action: :show
    else
      render 'items/edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :status_id, :delivery_charge_id, :location_id, :delivery_date_id,
                                 :description, :price).merge(user_id: current_user.id)
  end
end
