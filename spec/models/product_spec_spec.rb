require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: 'Weeds')
    end

    it 'should save when all fields are given' do
      product = Product.new(name: 'Dandelion', price: 500, quantity: 20000, category: @category)
      expect(product).to be_valid
    end

    it 'should fail when name is not given' do
      product = Product.new(name: nil, price: 500, quantity: 20000, category: @category)
      expect(product).not_to be_valid
    end

    it 'should fail when name is not given' do
      product = Product.new(name: nil, price: 500, quantity: 20000, category: @category)
      expect(product).not_to be_valid
    end
  end
end
