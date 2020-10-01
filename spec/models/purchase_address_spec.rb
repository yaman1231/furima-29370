require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do
        it 'クレジットカード情報、郵便番号、都道府県、市区町村、番地, 電話番号が存在すれば購入できる' do
          expect(@purchase_address).to be_valid
        end
        it '建物名は空でも購入できること' do
          @purchase_address.building_name = nil
          expect(@purchase_address).to be_valid
        end
      end

      context '商品購入がうまくいかないとき' do
        it '郵便番号が空では購入できない' do
          @purchase_address.post_code = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
        end
        it '郵便番号がハイフンを含んだ正しい形式でないと購入できない' do
          @purchase_address.post_code = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
        end
        it '電話番号にはハイフンは不要で、11桁でないと購入できない' do
          @purchase_address.phone_number = '123456789123'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
        end
      end
    end
  end
end
