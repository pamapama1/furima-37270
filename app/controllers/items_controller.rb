class ItemsController < ApplicationController
  def index
    # @items = Items.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    # Item.create(item_params)
    @item = Item.create(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render 'items/new'

    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :status_id, :delivery_charge_id, :location_id, :delivery_date_id,
                                 :description, :price).merge(user_id: current_user.id)
  end
end
