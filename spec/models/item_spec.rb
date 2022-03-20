require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    it 'nameが空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    # it "imageが空では登録できない" do
    # @item.image = ''
    # @item.valid?
    # end

    it 'descriptonは空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態に「---」が選択されている場合は出品できない' do
      @item.status_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担に「---」が選択されている場合は出品できない' do
      @item.delivery_charge_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.location_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include("Location can't be blank")
    end

    it '発送までの日数に「---」が選択されている場合は出品できない' do
      @item.delivery_date_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end

    it 'priceが空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは¥300以上でないと登録できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'priceは¥9999999以下でないと登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'priceは半角数値でないと登録できない' do
      @item.price = '１０００' # 全角
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'userが紐づいていないと出品できない'do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end
  end
end
