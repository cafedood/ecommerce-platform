class Order
  include Mongoid::Document

  field :product_id, type: BSON::ObjectId
  field :quantity, type: Integer
  field :price_per_item, type: Float
  field :total_price, type: Float

  belongs_to :product
end
