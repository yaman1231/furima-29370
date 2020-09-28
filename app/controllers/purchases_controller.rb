class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(@item.price: purchase_params[:item_price])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:item_price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_ceb39eb976541629f0da9481"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: purchase_params[:item_price],  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end