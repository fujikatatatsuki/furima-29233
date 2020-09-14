class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @Item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def image_params
      params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
    end

    def item_params
      params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_region_id, :shipping_day_id, :selling_price, :user)
    end
  end
end
