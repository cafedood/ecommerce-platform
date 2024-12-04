class Product
  include Mongoid::Document

  field :name, type: String
  field :category, type: String
  field :quantity, type: Integer
  field :price, type: Float
  field :dynamic_price, type: Float

  has_many :orders
end