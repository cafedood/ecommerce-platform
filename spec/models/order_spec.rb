require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'creates a valid order with sufficient inventory' do
    product = Product.create!(name: 'Test Product', category: 'Test', quantity: 10, price: 100.0, dynamic_price: 100.0)
    order = Order.create!(product: product, quantity: 2, price_per_item: product.dynamic_price, total_price: 200.0)
    expect(order).to be_valid
  end
end
