require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
   before do
    @order_address = FactoryBot.build(:order_address)
    end

  describe '商品購入機能'do
    context '登録がうまくいくとき'do
      it "item_id、user_id,post_code、address、tel_number、token、が存在すれば登録できる"do
        expect(@order_address).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
        it 'userが紐づいていないと登録できない'do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'itemが紐づいていないと登録できない'do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
        it "post_codeが空だと登録できない"do
          @order_address.post_code = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code can't be blank")
        end
        it "post_codeの最初の桁は3桁以外では登録できない"do
        @order_address.post_code = "1111-1111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it "post_codeの後半の桁は4桁以外では登録できない"do
        @order_address.post_code = "111-11111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it "post_codeはハイフンがないと登録できない"do
        @order_address.post_code = "1111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it "post_codeは半角文字列でないと登録できない"do
        @order_address.post_code = "１１１−１１１１" #全角
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it "addressが空だと登録できない"do
        @order_address.address = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address can't be blank")
        end
        it "municipalitiesが空だと登録できない"do
        @order_address.municipalities = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
        end
        it "tel_numberが空だと登録できない"do
          @order_address.tel_number = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
        end
        it "tel_numberは9桁未満では登録できない"do
        @order_address.tel_number = "12345678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
        end
        it "tel_numberは12桁以上では登録できない"do
        @order_address.tel_number = "1234567891011"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
        end
        it "tel_numberは半角数値でないと登録できない"do
        @order_address.tel_number = "１２３４５６７８９１"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
        end
        it "location_idが0では登録できない"do
          @order_address.location_id = "0"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Location can't be blank")
        end
        it "tokenが空では登録できない"do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end





