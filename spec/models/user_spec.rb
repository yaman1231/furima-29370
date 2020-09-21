require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、
          last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない場合は登録できないこと ' do
        @user.email = 'kkkgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = 'kkkgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角で入力して下さい', "Last name can't be blank")
      end
      it 'last_nameが全角でない場合は登録できないこと' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角で入力して下さい')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力して下さい', "First name can't be blank")
      end
      it 'first_nameが全角でない場合は登録できないこと' do
        @user.first_name = 'yuya'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力して下さい')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい', "Last name kana can't be blank")
      end

      it 'last_name_kanaが全角カタカナでない場合は登録できないこと' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい', "First name kana can't be blank")
      end

      it 'first_name_kanaが全角カタカナでない場合は登録できないこと' do
        @user.first_name_kana = 'ゆうや'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
      end
    end
  end
end
