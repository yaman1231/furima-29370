class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.order("created_at DESC")
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
    params.require(:item).permit(
    :name, :description, :category_id, 
    :condition_id, :postage_payer_id, 
    :prefecture_id, :handling_time_id, :price,
    :content, :image).merge(user_id: current_user.id)
  end


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
