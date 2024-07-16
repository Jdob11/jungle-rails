require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.create(name: 'Weeds')
    end

    let(:valid_attributes) do
      { name: 'Dandelion', price_cents: 500, quantity: 20000, category: @category }
    end

    it 'should save when all fields are given' do
      product = Product.new(valid_attributes)
      expect(product).to be_valid
    end
    
    it 'should fail when name is not given' do
      product = Product.new(valid_attributes.merge(name: nil))
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'should fail when price is not given' do
      product = Product.new(valid_attributes.merge(price_cents: nil))
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should fail when quantity is not given' do
      product = Product.new(valid_attributes.merge(quantity: nil))
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should fail when category is not given' do
      product = Product.new(valid_attributes.merge(category: nil))
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
