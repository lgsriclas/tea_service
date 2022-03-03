# Endpoints

## Tea

#### `GET /api/v1/teas`
#### RESPONSE

```
STATUS: 200
{
  "data": [
    {
      "id": "1",
      "type": "tea",
      "attributes": {
        "title": "Jasmine Tea",
        "description": "Green",
        "temperature": 105,
        "brew_time": 5
      }
    },
    {
      "id": "2",
      "type": "tea",
      "attributes": {
        "title": "Chai Tea",
        "description": "Black",
        "temperature": 120,
        "brew_time": 7
      }
    }
  ]
}
```

#### `GET /api/v1/teas/:id`
#### RESPONSE

```
STATUS: 200
{
  "data": [
    {
      "id": "3",
      "type": "tea",
      "attributes": {
        "title": "Raspberry Zinger",
        "description": "Herbal",
        "temperature": 115,
        "brew_time": 3
      }
    }
  ]
}
```

## Subscriptions

#### `POST /api/v1/customers/:customer_id/subscriptions`
##### Required Body Content:

```
{
  "title": "Jasmine Joy",
  "price": 10,
  "status": "Active",
  "frequency": "Monthly",
  "customer_id": "5",
  "tea_id": "10"
}
```

#### RESPONSE

```
STATUS: 201
{
  "data": {
    "id": "1",
    "type": "subscription",
    "attributes": {
      "title": "Jasmine Joy",
      "price": 10,
      "status": "Active",
      "frequency": "Monthly",
      "customer_id": "5",
      "tea_id": "10"
    }
  }
}
```

#### `GET /api/vi/customers/:customer_id/subscriptions`
#### RESPONSE

```
STATUS: 200
{
  "data": [
    {
      "id": "1",
      "type": "subscription",
      "attributes": {
          "title": "My Subscription",
          "price": 10,
          "status": "Active",
          "frequency": "Monthly",
          "customer_id": 5,
          "tea_id": 10
      }
    }
  ]
}
```

#### `DELETE /api/vi/customers/:customer_id/subscriptions/1`
#### RESPONSE

```
STATUS: 204


```