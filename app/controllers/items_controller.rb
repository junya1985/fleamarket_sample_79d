class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @categoryitems = Item.all.order("RAND()")
    @branditems = Item.all.order("id DESC")
  end

  def new
    # ブランドテーブルとのアソシエーションいるなこれ
    if user_signed_in?
      @item=Item.new
      @item.images.new
      @category_parent_array=Category.where(ancestry: nil)
    else
      redirect_to new_user_session_path
    end

  end

  def create
    @item=Item.create(item_params)
    redirect_to root_path
  end


  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :category_id, :shipping_cost, :condition, :price, :shipping_id, :prefecture_id, :shipping_day, images_attributes:[:image]).merge(seller_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end

