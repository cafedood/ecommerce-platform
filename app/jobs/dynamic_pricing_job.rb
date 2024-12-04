class DynamicPricingJob
    include Sidekiq::Worker

    def perform
      Product.all.each do |product|
        competitor_price = fetch_competitor_price(product.id)
        new_price = calculate_dynamic_price(product, competitor_price)
        product.update!(dynamic_price: new_price)
      end
    end

    private

    def fetch_competitor_price(product_id)
      response = HTTParty.get("https://sinatra-pricing-api.fly.dev/prices/#{product_id}")
      response['price']
    rescue StandardError
      nil
    end

    def calculate_dynamic_price(product, competitor_price)
      demand_factor = 1 + product.orders.count / 10.0
      inventory_factor = product.quantity < 10 ? 1.2 : 0.9
      competitor_factor = competitor_price ? competitor_price / product.price : 1

      (product.price * demand_factor * inventory_factor * competitor_factor).round(2)
    end
  end
