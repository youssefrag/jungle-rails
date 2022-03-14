require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.create(name: 'clothes')
      @product = Product.new(name: 'shoes', price: 10, quantity: 5, category_id: @category.id)
    end

    context "Product saves correctly" do
      it "pass validation when name, price, quantity, category are set" do
        expect(@product.save).to be true
        expect(@product.id).not_to be_nil
      end
    end
    context "validates name" do
      it "does not save if name is missing" do
        @product.name = ""
        expect(@product.save).to be false
      end
    end
    context "validates price" do
      it "does not save if price is missing" do
        @product.price = ''
        expect(@product.save).to be false
      end
    end
    context "validates quantity" do
      it "does not save if quantity is missing" do
        @product.quantity = ''
        expect(@product.save).to be false
      end
    end
    context "validates category" do
      it "does not save if category is missing" do
        @product.category_id = ''
        expect(@product.save).to be false
      end
    end
  end
end