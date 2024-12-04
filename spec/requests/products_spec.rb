require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  let!(:product) { Product.create!(name: 'Test Product', category: 'Test', quantity: 10, price: 100.0, dynamic_price: 100.0) }

  it 'returns all products' do
    get '/products'
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body).size).to be >= 1
  end

  it 'returns a specific product' do
    get "/products/#{product.id}"
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)['name']).to eq('Test Product')
  end
end
