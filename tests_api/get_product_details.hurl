# Prepare data
GET http://localhost:3000/products
HTTP 200
[Captures]
prod_id: jsonpath "$[0]._id"
category: jsonpath "$[0].category"
name: jsonpath "$[0].name"

# Get product details
GET http://localhost:3000/products/{{prod_id}}
HTTP 200
[Asserts]
jsonpath "$._id" == {{prod_id}}
jsonpath "$.category" == {{category}}
jsonpath "$.name" == {{name}}
