class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    Purchase.create(purchase_params)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:post_code, :prefecture_id, :city, :street_number,
    :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  #def pay_item
    #Payjp.api_key = "sk_test_ceb39eb976541629f0da9481"  # PAY.JPテスト秘密鍵
    #Payjp::Charge.create(
      #amount: purchase_params[:price],  # 商品の値段
      #card: purchase_params[:token],    # カードトークン
      #currency:'jpy'                 # 通貨の種類(日本円)
    #)
  #end
end