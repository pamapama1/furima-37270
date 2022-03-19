require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/furima-header01.png')
  end

  describe "商品登録" do

        it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      #it "imageが空では登録できない" do
       # @item.image = ''
        #@item.valid?
      #end

      it "descriptonは空では登録できない"do
       @item.description = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Description can't be blank", "User must exist")
      end

      it "category_idが空だと登録できない"do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "User must exist")
      end

      it "status_idが空だと登録できない"do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "delivery_charge_idが空だと登録できない"do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")

      end

      it "location_idが空だと登録できない"do
      @item.location_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Location can't be blank")

      end

      it "delivery_date_idが空だと登録できない"do
      @item.delivery_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")

      end

      it "priceが空だと登録できない"do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceは¥300以上でないと登録できない"do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceは¥9999999以下でないと登録できない"do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceは半角数値でないと登録できない"do
      @item.price = '１０００'#全角
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
   
      end

    end
end
