class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

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
  end

  def edit
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to controller: :items, action: :show
    else
      render 'items/edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to controller: :items, action: :index
    else
      render 'items/show'
    end
   end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :status_id, :delivery_charge_id, :location_id, :delivery_date_id,
                                 :description, :price).merge(user_id: current_user.id)
  end
end
