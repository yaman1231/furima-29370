class PurchasesController < ApplicationController
  before_action :move_to_index
  before_action :set_item_id, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if @item.user_id == current_user.id || !@item.purchase.nil?
  end

  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def address_params
    params.permit(:token, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
