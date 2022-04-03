require 'rails_helper'
describe '商品購入機能'do
context '登録がうまくいくとき'do
  it "post_code、address、tel_numberが存在すれば登録できる"
    expect(@order).to be_valid
  end
end

contexit '登録がうまくいかないとき' do
  it "post_codeが空だと登録できない"do
    @order

  end
  it "post_codeの最初の桁は3桁以外では登録できない"do
  end
  it "post_codeの後半の桁は4桁以外では登録できない"do
  end
  it "post_codeはハイフンがないと登録できない"do
  end
  it "post_codeは半角文字列でないと登録できない"do
  end
  it "addressが空だと登録できない"do
  end
  it "municipalitiesが空だと登録できない"do
  end
  it "tel_numberが空だと登録できない"do
  end
  it "tel_numberは9桁未満では登録できない"do
  end
  it "tel_numberは12桁以上では登録できない"do
  end
  it "tel_numberは半角数値でないと登録できない"do
  end
  it "location_idが0では登録できない"do
  end