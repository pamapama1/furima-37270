class ItemsController < ApplicationController
  def index
    #@items = Items.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
end
