# Place an order
POST http://localhost:3000/orders
{
    "product_id":"674fbed5ebd525f9f13ce613",
    "quantity":5
}
HTTP 201
[Asserts]
jsonpath "$.order.product_id" == "674fbed5ebd525f9f13ce613"
jsonpath "$.order.quantity" == 5