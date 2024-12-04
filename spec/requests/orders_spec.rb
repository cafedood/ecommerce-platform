require 'rails_helper'

RSpec.describe 'Orders API', type: :request do
  it 'creates an order successfully' do
    product = Product.create!(name: 'Test Product', category: 'Test', quantity: 20, price: 10.0, dynamic_price: 10.0)

    post '/orders', params: { product_id: product.id.to_s, quantity: 5 }
    expect(response).to have_http_status(:created)

    product.reload
    expect(product.quantity).to eq(15)
  end
end
