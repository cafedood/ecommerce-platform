require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with valid attributes' do
    product = Product.new(name: 'Test Product', category: 'Test', quantity: 10, price: 100.0, dynamic_price: 100.0)
    expect(product).to be_valid
  end

  it 'updates dynamic price correctly' do
    product = Product.create!(name: 'Test Product', category: 'Test', quantity: 10, price: 100.0, dynamic_price: 100.0)
    product.update!(dynamic_price: 120.0)
    expect(product.dynamic_price).to eq(120.0)
  end
end
