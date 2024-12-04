require 'rails_helper'

RSpec.describe DynamicPricingJob, type: :job do
  let!(:product) { Product.create!(name: 'Test Product', category: 'Test', quantity: 10, price: 100.0, dynamic_price: 100.0) }

  it 'updates product prices based on the pricing engine' do
    allow_any_instance_of(DynamicPricingJob).to receive(:fetch_competitor_price).and_return(90.0)
    expect { DynamicPricingJob.new.perform }.to change { product.reload.dynamic_price }
  end
end
