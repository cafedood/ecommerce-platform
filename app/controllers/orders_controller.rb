class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    if product.quantity >= quantity
      total_price = product.dynamic_price * quantity
      order = Order.create!(
        product: product,
        quantity: quantity,
        price_per_item: product.dynamic_price,
        total_price: total_price
      )
      product.update!(quantity: product.quantity - quantity)

      render json: { order: order }, status: :created
    else
      render json: { error: 'Not enough inventory' }, status: :unprocessable_entity
    end
  end
end
