## Database Design Document

| No. | Data Table Name | Chinese Name          |
| --- | --------------- | --------------------- |
| 1   | employee        | Employee Table        |
| 2   | category        | Category Table        |
| 3   | dish            | Dish Table            |
| 4   | dish_flavor     | Dish Flavor Table     |
| 5   | setmeal         | Set Meal Table        |
| 6   | setmeal_dish    | Set Meal-Dish Relation Table |
| 7   | user            | User Table            |
| 8   | address_book    | Address Table         |
| 9   | shopping_cart   | Shopping Cart Table   |
| 10  | orders          | Orders Table          |
| 11  | order_detail    | Order Detail Table    |

### 1. employee

The employee table is for storing internal employee information of the business. The specific table structure is as follows:

| Field Name  | Data Type   | Description  | Notes          |
| ----------- | ----------- | ------------ | -------------- |
| id          | bigint      | Primary Key  | Auto Increment |
| name        | varchar(32) | Name         |                |
| username    | varchar(32) | Username     | Unique         |
| password    | varchar(64) | Password     |                |
| phone       | varchar(11) | Phone Number |                |
| sex         | varchar(2)  | Gender       |                |
| id_number   | varchar(18) | ID Number    |                |
| status      | int         | Account Status | 1 Normal 0 Locked |
| create_time | datetime    | Creation Time |               |
| update_time | datetime    | Last Modified Time |           |
| create_user | bigint      | Creator ID   |                |
| update_user | bigint      | Last Modifier ID |             |

### 2. category

The category table is for storing the classification information of goods. The specific table structure is as follows:

| Field Name  | Data Type   | Description    | Notes                     |
| ----------- | ----------- | -------------- | ------------------------- |
| id          | bigint      | Primary Key    | Auto Increment            |
| name        | varchar(32) | Category Name  | Unique                    |
| type        | int         | Category Type  | 1 Dish Category 2 Set Meal Category |
| sort        | int         | Sort Field     | For sorting category data |
| status      | int         | Status         | 1 Enable 0 Disable        |
| create_time | datetime    | Creation Time  |                           |
| update_time | datetime    | Last Modified Time |                       |
| create_user | bigint      | Creator ID     |                           |
| update_user | bigint      | Last Modifier ID |                         |

### 3. dish

The dish table is for storing information about dishes. The specific table structure is as follows:

| Field Name   | Data Type     | Description   | Notes        |
| ------------ | ------------- | ------------  | ------------ |
| id           | bigint        | Primary Key   | Auto Increment |
| name         | varchar(32)   | Dish Name     | Unique       |
| category_id  | bigint        | Category ID   | Logical Foreign Key |
| price        | decimal(10,2) | Dish Price    |              |
| image        | varchar(255)  | Image Path    |              |
| description  | varchar(255)  | Dish Description |            |
| status       | int           | Sale Status   | 1 On Sale 0 Off Sale |
| create_time  | datetime      | Creation Time |              |
| update_time  | datetime      | Last Modified Time |          |
| create_user  | bigint        | Creator ID    |              |
| update_user  | bigint        | Last Modifier ID |            |

### 4. dish_flavor

The dish_flavor table is for storing information about the flavors of dishes. The specific table structure is as follows:

| Field Name | Data Type    | Description | Notes     |
| ---------- | ------------ | ----------- | --------- |
| id         | bigint       | Primary Key | Auto Increment |
| dish_id    | bigint       | Dish ID     | Logical Foreign Key |
| name       | varchar(32)  | Flavor Name |           |
| value      | varchar(255) | Flavor Value |          |

### 5. setmeal

The setmeal table is for storing information about set meals. The specific table structure is as follows:

| Field Name   | Data Type     | Description   | Notes        |
| ------------ | ------------- | ------------  | ------------ |
| id           | bigint        | Primary Key   | Auto Increment |
| name         | varchar(32)   | Set Meal Name | Unique       |
| category_id  | bigint        | Category ID  

 | Logical Foreign Key |
| price        | decimal(10,2) | Set Meal Price |              |
| image        | varchar(255)  | Image Path    |              |
| description  | varchar(255)  | Set Meal Description |        |
| status       | int           | Sale Status   | 1 On Sale 0 Off Sale |
| create_time  | datetime      | Creation Time |              |
| update_time  | datetime      | Last Modified Time |          |
| create_user  | bigint        | Creator ID    |              |
| update_user  | bigint        | Last Modifier ID |            |

### 6. setmeal_dish

The setmeal_dish table is for the set meal-dish relationship, used to store the association between set meals and dishes. The specific table structure is as follows:

| Field Name  | Data Type     | Description     | Remarks        |
| ----------- | ------------- | --------------- | -------------- |
| id          | bigint        | Primary Key     | Auto Increment |
| setmeal_id  | bigint        | Set Meal ID     | Logical Foreign Key |
| dish_id     | bigint        | Dish ID         | Logical Foreign Key |
| name        | varchar(32)   | Dish Name       | Redundant Field |
| price       | decimal(10,2) | Dish Unit Price | Redundant Field |
| copies      | int           | Number of Dishes |                |

### 7. user

The user table is for storing information about C-end users. The specific table structure is as follows:

| Field Name  | Data Type    | Description          | Remarks    |
| ----------- | ------------ | --------------------- | ---------- |
| id          | bigint       | Primary Key          | Auto Increment |
| openid      | varchar(45)  | Unique Identifier for WeChat Users | |
| name        | varchar(32)  | User Name            |            |
| phone       | varchar(11)  | Phone Number         |            |
| sex         | varchar(2)   | Gender               |            |
| id_number   | varchar(18)  | ID Number            |            |
| avatar      | varchar(500) | WeChat User Avatar Path |          |
| create_time | datetime     | Registration Time    |            |

### 8. address_book

The address_book table is for storing shipping address information for C-end users. The specific table structure is as follows:

| Field Name     | Data Type    | Description      | Remarks                |
| -------------- | ------------ | ---------------- | ---------------------- |
| id             | bigint       | Primary Key      | Auto Increment         |
| user_id        | bigint       | User ID          | Logical Foreign Key    |
| consignee      | varchar(50)  | Recipient        |                        |
| sex            | varchar(2)   | Gender           |                        |
| phone          | varchar(11)  | Phone Number     |                        |
| province_code  | varchar(12)  | Province Code    |                        |
| province_name  | varchar(32)  | Province Name    |                        |
| city_code      | varchar(12)  | City Code        |                        |
| city_name      | varchar(32)  | City Name        |                        |
| district_code  | varchar(12)  | District Code    |                        |
| district_name  | varchar(32)  | District Name    |                        |
| detail         | varchar(200) | Detailed Address | Specific to door number |
| label          | varchar(100) | Label            | Company, Home, School  |
| is_default     | tinyint(1)   | Default Address  | 1 Yes, 0 No            |

### 9. shopping_cart

The shopping_cart table is for storing shopping cart information for C-end users. The specific table structure is as follows:

| Field Name  | Data Type     | Description      | Remarks        |
| ----------- | ------------- | ---------------- | -------------- |
| id          | bigint        | Primary Key      | Auto Increment |
| name        | varchar(32)   | Product Name     |                |
| image       | varchar(255)  | Product Image Path |              |
| user_id     | bigint        | User ID          | Logical Foreign Key |
| dish_id     | bigint        | Dish ID          | Logical Foreign Key |
| setmeal_id  | bigint        | Set Meal ID      | Logical Foreign Key |
| dish_flavor | varchar(50)   | Dish Flavor      |                |
| number      | int           | Quantity         |                |
| amount      | decimal(10,2) | Unit Price       |                |
| create_time | datetime      | Creation Time    |                |

### 10. orders

The orders table is for storing order data for C-end users. The specific table structure is as follows:

| Field Name             | Data Type     | Description          | Remarks                                                   |
| ---------------------- | ------------- | -------------------- | --------------------------------------------------------- |
| id                     | bigint        | Primary Key          | Auto Increment                                            |
| number                 | varchar(50)   | Order Number         |                                                           |
| status                 | int           | Order Status         | 1 Awaiting Payment 2 Awaiting Acceptance 3 Accepted 4 Delivering 5 Completed 6 Cancelled |
| user_id                | bigint        | User ID              | Logical Foreign Key                                       |
| address_book_id        | bigint        | Address ID           | Logical Foreign Key                                       |
| order_time             | datetime      | Order Time          

 |                                                           |
| checkout_time          | datetime      | Payment Time         |                                                           |
| pay_method             | int           | Payment Method       | 1 WeChat Pay 2 Alipay                                     |
| pay_status             | tinyint       | Payment Status       | 0 Not Paid 1 Paid 2 Refunded                              |
| amount                 | decimal(10,2) | Order Amount         |                                                           |
| remark                 | varchar(100)  | Remarks              |                                                           |
| phone                  | varchar(11)   | Phone Number         |                                                           |
| address                | varchar(255)  | Detailed Address     |                                                           |
| user_name              | varchar(32)   | User Name            |                                                           |
| consignee              | varchar(32)   | Recipient            |                                                           |
| cancel_reason          | varchar(255)  | Order Cancellation Reason |                                                      |
| rejection_reason       | varchar(255)  | Rejection Reason     |                                                           |
| cancel_time            | datetime      | Order Cancellation Time |                                                      |
| estimated_delivery_time| datetime      | Estimated Delivery Time |                                                      |
| delivery_status        | tinyint       | Delivery Status      | 1 Immediate Dispatch 0 Choose Specific Time              |
| delivery_time          | datetime      | Delivery Time        |                                                           |
| pack_amount            | int           | Packing Fee          |                                                           |
| tableware_number       | int           | Number of Tablewares |                                                           |
| tableware_status       | tinyint       | Tableware Quantity Status | 1 Provide According to Meal 0 Choose Specific Quantity |

### 11. order_detail

The order_detail table is for storing order detail data for C-end users. The specific table structure is as follows:

| Field Name  | Data Type     | Description      | Remarks        |
| ----------- | ------------- | ---------------- | -------------- |
| id          | bigint        | Primary Key      | Auto Increment |
| name        | varchar(32)   | Product Name     |                |
| image       | varchar(255)  | Product Image Path |              |
| order_id    | bigint        | Order ID         | Logical Foreign Key |
| dish_id     | bigint        | Dish ID          | Logical Foreign Key |
| setmeal_id  | bigint        | Set Meal ID      | Logical Foreign Key |
| dish_flavor | varchar(50)   | Dish Flavor      |                |
| number      | int           | Quantity         |                |
| amount      | decimal(10,2) | Unit Price       |                |