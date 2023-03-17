#### Traidr API Documentation

- Base URL: api.lvh.me:3000/v1
- Author: [Ben Essilfie](https://www.linkedin.com/in/benessilfie/)

## Users

### 1. Create User

**Request**
URL - `/users`
Method - `POST`

**Request Body**

```json
{
  "user": {
    "email": "string",
    "password": "string"
  }
}
```

**Response**
Status: `201 - Created`

**Response Body**

```json
{
  "data": {
    "id": "integer",
    "type": "string",
    "attributes": {
      "email": "string"
    },
    "relationships": {
      "products": {
        "data": []
      }
    }
  }
}
```

### 2. Get User

**Request**
URL - `/users/:id`
Method - `GET`

**Response**
Status: `200 - OK`

**Response Body**

```json
{
  "data": {
    "id": "integer",
    "type": "string",
    "attributes": {
      "email": "string"
    },
    "relationships": {
      "products": {
        "data": []
      }
    }
  },
  "included": []
}
```

### 3. Update user

**Request**
Url - `/users/:id`
Method - `PUT`
Headers - `{Authorization: 'Bearer <token>'}`

**Request Body**

```json
{
  "user": {
    "email": "string",
    "password": "string"
  }
}
```

**Response**
Status: `200 - OK`

**Response Body**

```json
{
  "data": {
    "id": "integer",
    "type": "string",
    "attributes": {
      "email": "string"
    },
    "relationships": {
      "products": {
        "data": []
      }
    }
  }
}
```

### 4. Delete User

**Request**
Url - `/users/:id`
Method - `DELETE`
Headers - `{Authorization: 'Bearer <token>'}`

**Response**
Status: `204 - No Content`

### 5. Login

**Request**
Url - `/auth/sessions`
Method - `POST`

**Request Body**

```json
{
  "user": {
    "email": "string",
    "password": "string"
  }
}
```

**Response**
Status: `201 - Created`

**Response Body**

```json
{
  "token": "tokenized_string",
  "email": "string"
}
```

### 7. Logout

**Request**
Url - `/auth/sessions/:id`
Method - `DELETE`
Headers - `{Authorization: 'Bearer <token>'}`

**Response**
Status: `200 - OK`

body

```json
{
  "message": "Logout successful"
}
```

## Products

### 1. Get All Products

**Request**
URL - `/products`
Method - `GET`

**Response**
Status: `200 - OK`

**Response Body**

```json
{
    "data": [
        {
            "id": "integer",
            "type": "string",
            "attributes": {
                "title": "string",
                "price": "decimal",
                "quantity": integer,
                "published": boolean
            },
            "relationships": {
                "user": {
                    "data": {
                        "id": "integer",
                        "type": "string"
                    }
                }
            }
        },
        {
            "id": "integer",
            "type": "string",
            "attributes": {
                "title": "string",
                "price": "decimal",
                "quantity": integer,
                "published": boolean
            },
            "relationships": {
                "user": {
                    "data": {
                        "id": "integer",
                        "type": "string"
                    }
                }
            }
        }
    ],
    "links": {
        "first": "/v1/products?page=1",
        "last": "/v1/products?page=1",
        "prev": "/v1/products",
        "next": "/v1/products"
    }
}
```

### 2. Get One Product

**Request**
URL - `/products/:id`
Method - `GET`

**Response**
Status: `200 - OK`

**Response Body**

```json
{
    "data": {
        "id": "integer",
        "type": "string",
        "attributes": {
            "title": "string",
            "price": "decimal",
            "quantity": integer,
            "published": boolean
        },
        "relationships": {
            "user": {
                "data": {
                    "id": "integer",
                    "type": "string"
                }
            }
        }
    },
    "included": [
        {
            "id": "integer",
            "type": "string",
            "attributes": {
                "email": "string"
            },
            "relationships": {
                "products": {
                    "data": [
                        {
                            "id": "integer",
                            "type": "string"
                        },
                        {
                            "id": "integer",
                            "type": "string"
                        },
                        {
                            "id": "integer",
                            "type": "string"
                        }
                    ]
                }
            }
        }
    ]
}
```

### 3. Create Product

**Request**
Url - `/products`
Method - `POST`
Headers - `{Authorization: 'Bearer <token>'}`

**Request Body**

```json
{
    "product": {
        "title": "string",
        "price": decimal,
        "quantity": integer,
        "published": boolean
    }
}
```

**Response**
Status: `201 - Created`

**Response Body**

```json
{
    "data": {
        "id": "integer",
        "type": "string",
        "attributes": {
            "title": "string",
            "price": "decimal",
            "quantity": integer,
            "published": boolean
        },
        "relationships": {
            "user": {
                "data": {
                    "id": "integer",
                    "type": "string"
                }
            }
        }
    }
}
```

### 4. Update Product

**Request**
Url - `/products/:id`
Method - `PUT`
Headers - `{Authorization: 'Bearer <token>'}`

**Request Body**

```json
{
    "product": {
        "title": "string",
        "price": decimal,
        "quantity": integer,
        "published": boolean
    }
}
```

**Response**
Status: `200 - OK`

**Response Body**

```json
{
    "data": {
        "id": "integer",
        "type": "string",
        "attributes": {
            "title": "string",
            "price": "decimal",
            "quantity": integer,
            "published": boolean
        },
        "relationships": {
            "user": {
                "data": {
                    "id": "integer",
                    "type": "string"
                }
            }
        }
    }
}
```

### 5. Delete Product

**Request**
Url - `/products/:id`
Method - `DELETE`
Headers - `{Authorization: 'Bearer <token>'}`

**Response**
Status: `204 - No Content`

## Orders

### 1. Get All Orders

**Request**
URL - `/orders`
Method - `GET`
Headers - `{Authorization: 'Bearer <token>'}`

**Response**
Status: `200 - OK`

**Response Body**

```json
{
  "data": [
    {
      "id": "integer",
      "type": "string",
      "relationships": {
        "user": {
          "data": {
            "id": "integer",
            "type": "string"
          }
        },
        "products": {
          "data": []
        }
      }
    },
    {
      "id": "integer",
      "type": "string",
      "relationships": {
        "user": {
          "data": {
            "id": "integer",
            "type": "string"
          }
        },
        "products": {
          "data": [
            {
              "id": "integer",
              "type": "string"
            },
            {
              "id": "integer",
              "type": "string"
            }
          ]
        }
      }
    }
  ],
  "links": {
    "first": "/v1/orders?page=1",
    "last": "/v1/orders?page=1",
    "prev": "/v1/orders",
    "next": "/v1/orders"
  }
}
```

### 2. Get Order

**Request**
URL - `/orders/:id`
Method - `GET`
Headers - `{Authorization: 'Bearer <token>'}`

**Response**
Status: `200 - OK`

**Response Body**

```json
{
  "data": {
    "id": "integer",
    "type": "string",
    "relationships": {
      "user": {
        "data": {
          "id": "integer",
          "type": "string"
        }
      },
      "products": {
        "data": []
      }
    }
  },
  "included": []
}
```

### 3. Create Order

**Request**
Url - `/orders`
Method - `POST`
Headers - `{Authorization: 'Bearer <token>'}`

**Request Body**

```json
{
  "order": {
    "product_ids_and_quantities": [
      {
        "product_id": integer,
        "quantity": integer
      },
      {
        "product_id": integer,
        "quantity": integer
      }
    ]
  }
}

```

**Response**
Status: `201 - Created`

**Response Body**

```json
{
  "data": {
    "id": "integer",
    "type": "string",
    "relationships": {
      "user": {
        "data": {
          "id": "integer",
          "type": "string"
        }
      },
      "products": {
        "data": [
          {
            "id": "integer",
            "type": "string"
          },
          {
            "id": "integer",
            "type": "string"
          }
        ]
      }
    }
  }
}
```
