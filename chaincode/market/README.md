# Account chaincode

* function
  * [put_seller](#put_seller)
  * [get_seller](#get_seller)
  * [put_buyer](#put_buyer)
  * [get_buyer](#get_buyer)
  * [put_product](#put_product)
  * [get_product](#get_product)
  * [get_seller_product](#get_seller_product)
  * [buy](#buy)
  * [get_bill](#get_bill)
  * [get_buyer_bill](#get_buyer_bill)
* document
  * [seller](#seller)
  * [buyer](#buyer)
  * [product](#product)
  * [bill](#bill)

## put_seller

Create `seller` document

### Argument

| index | name        |
|-------|-------------|
| 0     | seller ID   |
| 1     | item number |

* `seller ID` must exist on account channel
* `item number` must be integer string

## get_seller

Get `seller` document

### Argument

| index | name      |
|-------|-----------|
| 0     | seller ID |

### Return example

seller exists
```
{
    "seller_id": "user_1",
    "item_number": 0
}
```

seller does not exist
```
(empty string)
```

## put_buyer

Create `buyer` document

### Argument

| index | name        |
|-------|-------------|
| 0     | buyer ID    |
| 1     | bill number |

* `buyer ID` must exist on account channel 
* `bill number` must be integer string

## get_buyer

Get `buyer` document

### Argument

| index | name     |
|-------|----------|
| 0     | buyer ID |

### Return example

buyer exists
```
{
    "buyer_id": "user_2",
    "bill_number": 0
}
```

buyer does not exist
```
(empty string)
```

## put_product

Create `product` document

### Argument

| index | name      |
|-------|-----------|
| 0     | seller ID |
| 1     | price     |

* `price` must be integer string

## get_product

Get `product` document

### Argument

| index | name           |
|-------|----------------|
| 0     | seller ID      |
| 1     | item sequence  |

## get_seller_product

Get `product` documents of a seller

### Argument

| index | name      |
|-------|-----------|
| 0     | seller ID |

## buy

Create `bill` document and send transfer request to server

### Argument

| index | name          |
|-------|---------------|
| 0     | buyer ID      |
| 1     | seller ID     |
| 2     | item sequence |

## get_bill

Get `bill` document

### Argument

| index | name        |
|-------|-------------|
| 0     | buyer ID    |
| 1     | bill number |

## get_buyer_bill

Get `bill` documents of a buyer

| index | name        |
|-------|-------------|
| 0     | buyer ID    |

## seller

| field       | value example |
|-------------|---------------|
| seller_id   | "user_1"      |
| item_number | 0             |

## buyer

| field       | value example |
|-------------|---------------|
| seller_id   | "user_2"      |
| bill_number | 0             |

## product

| field     | value example |
|-----------|---------------|
| seller_id | "user_1"      |
| item_seq  | 0             |
| price     | 1000          |

## bill

| field    | value example |
|----------|---------------|
| seller   | "user_1"      |
| buyer    | "user_2"      |
| paid     | 1000          |
| item_seq | 0             |
| bill_seq | 0             |
