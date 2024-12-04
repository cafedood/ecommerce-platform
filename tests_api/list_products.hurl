# list all products
GET http://localhost:3000/products
HTTP 200
[Asserts]
jsonpath "$" count > 0