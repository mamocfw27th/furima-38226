require 'rails_helper'  
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる' do
      it '商品画像、商品名、商品説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在すれば出品ができる' do
      expect(@item).to be_valid
      end
    end
      
    context '商品の出品ができない' do 
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では出品出来ない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '送料が空では出品できない' do
        @item.postage = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '送料に「---」が選択されている場合は出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域が空では出品できない' do
        @item.area = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数が空では出品できない' do
        @item.arrival = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrival can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.arrival_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrival can't be blank")
      end
      it '価格がからでは出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = 'A'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not a number")
      end
      it '価格が300円未満では出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9999999円を超えると出品できない' do
        @item.price = '99999999'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price must be less than or equal to 9999999")
      end
      it 'userが紐づいていないと出品できない' do

      
      end
    end
  end
end