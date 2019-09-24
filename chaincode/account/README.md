# Account chaincode

* function
  * [put_user](#put_user)
  * [get_user](#get_user)
* document
  * [user](#user)

## put_user

Create `user` document

### Argument

| index | name         |
|-------|--------------|
| 0     | user ID      |
| 1     | user account |

## get_user

Get `user` document

### Argument

| index | name    |
|-------|---------|
| 0     | user ID |

### Return example

user exists
```
{
    "user_id": "user_1",
    "account": "account_1"
}
```

user does not exist
```
(empty string)
```

## user document

| key     | value example |
|---------|---------------|
| user_id | "user_1"      |
| account | "account_1"   |
