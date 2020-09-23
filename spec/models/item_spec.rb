require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample1.png')
    end


    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it "出品画像、商品名、商品の説明、カテゴリー、商品の状態, 配送料の負担, 
        発送元の地域, 発送までの日数, 価格が存在すれば出品できる" do
          expect(@item).to be_valid
        end
      end

      
      context '新規登録がうまくいかないとき' do
        it '出品画像が空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が空では出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it '商品の説明が空では出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'カテゴリーが「---」では出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it '商品の状態が「---」では出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end

        it '配送料の負担が「---」では出品できない' do
          @item.postage_payer_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
        end

        it '発送元の地域が「---」では出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it '発送までの日数が「---」では出品できない' do
          @item.handling_time_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Handling time must be other than 1")
        end

        it '価格が空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格が300円より小さかった場合、出品できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 300円以上9999999円以下で入力して下さい")
        end
        it '価格が9999999円より大きかった場合、出品できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 300円以上9999999円以下で入力して下さい")
        end
        it '価格が半角数字以外では出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 半角数字のみで入力して下さい")
        end
      end
    end
  end
end