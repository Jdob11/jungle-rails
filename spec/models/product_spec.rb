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
    end

    it 'should fail when price is not given' do
      product = Product.new(valid_attributes.merge(price_cents: nil))
      expect(product).not_to be_valid
    end
  end
end
