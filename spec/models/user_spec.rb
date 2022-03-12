require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailは重複して登録できない"do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "emailは@が入っていないと登録できない"do
      @user.email = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない"do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字以上ないと登録できない"do
      @user.password = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

    end
    it "passwordは半角英数字混合でないと登録できない"do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字を含めて設定してください")

    end
    it "passwordとpassword_confirmationが同じでないと登録できない"do
      @user.password_confirmation = 'aaaaa2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end
    it "first_nameが空だと登録できない"do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
  
    end
    it "second_nameが空だと登録できない"do
      @user.second_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name can't be blank")
  
    end
    it "first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない"do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")

    end
    it "second_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない"do
      @user.second_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name 全角文字を使用してください")

    end
    it "first_name_kanaは空だと登録できない"do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
  
    end
    it "second_name_kanaが空だと登録できない"do
      @user.second_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana can't be blank")

    end
    it "first_name_kanaは全角（カタカナ）でないと登録できない"do
    @user.first_name_kana = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")

    end
    it "second_name_kanaは全角（カタカナ）でないと登録できない"do
    @user.second_name_kana = 'taro'
    @user.valid?
    expect(@user.errors.full_messages).to include("Second name kana 全角カナ文字を使用してください")

    end
    it "birthdayは空だと登録できない"do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")

    end
  end




end
