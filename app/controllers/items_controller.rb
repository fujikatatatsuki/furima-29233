class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_region_id, :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
