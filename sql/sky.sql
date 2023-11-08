

DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `user_id` bigint NOT NULL COMMENT 'User ID',
  `consignee` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Consignee',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT 'Sex',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'Phone Number',
  `province_code` varchar(12) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'Provincial Division Code',
  `province_name` varchar(32) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'Provincial Name',
  `city_code` varchar(12) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'City Division Code',
  `city_name` varchar(32) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'City Name',
  `district_code` varchar(12) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'District Division Code',
  `district_name` varchar(32) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'District Name',
  `detail` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'Detailed Address',
  `label` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'Label',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Default 0 No, 1 Yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Address Book';

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `type` int DEFAULT NULL COMMENT 'Type 1 Dish Category 2 Set Menu Category',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Category Name',
  `sort` int NOT NULL DEFAULT '0' COMMENT 'Order',
  `status` int DEFAULT NULL COMMENT 'Category Status 0: Disabled, 1: Enabled',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation Time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update Time',
  `create_user` bigint DEFAULT NULL COMMENT 'Creator',
  `update_user` bigint DEFAULT NULL COMMENT 'Modifier',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Dishes and Set Menu Category';

INSERT INTO `category` VALUES (11,1,'Beverages',10,1,'2023-06-09 22:09:18','2023-06-09 22:09:18',1,1);
INSERT INTO `category` VALUES (12,1,'Traditional Staples',9,1,'2023-06-09 22:09:32','2023-06-09 22:18:53',1,1);
INSERT INTO `category` VALUES (13,2,'Popular Set Menus',12,1,'2023-06-09 22:11:38','2023-06-10 11:04:40',1,1);
INSERT INTO `category` VALUES (15,2,'Business Set Menus',13,1,'2023-06-09 22:14:10','2023-06-10 11:04:48',1,1);
INSERT INTO `category` VALUES (16,1,'Grilled Fish à la Sichuan',4,1,'2023-06-09 22:15:37','2023-08-31 14:27:25',1,1);
INSERT INTO `category` VALUES (17,1,'Bullfrog Sichuan Style',5,1,'2023-06-09 22:16:14','2023-08-31 14:39:44',1,1);
INSERT INTO `category` VALUES (18,1,'Special Steamed Dishes',6,1,'2023-06-09 22:17:42','2023-06-09 22:17:42',1,1);
INSERT INTO `category` VALUES (19,1,'Fresh Vegetables',7,1,'2023-06-09 22:18:12','2023-06-09 22:18:28',1,1);
INSERT INTO `category` VALUES (20,1,'Boiled Fish',8,1,'2023-06-09 22:22:29','2023-06-09 22:23:45',

DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Dish name',
  `category_id` bigint NOT NULL COMMENT 'Dish category id',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Dish price',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Image',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Description',
  `status` int DEFAULT '1' COMMENT '0 discontinued 1 available',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `create_user` bigint DEFAULT NULL COMMENT 'Creator',
  `update_user` bigint DEFAULT NULL COMMENT 'Editor',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Dish';

INSERT INTO `dish` VALUES (46,'Herbal Lemonade',11,6.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png','',1,'2023-06-09 22:40:47','2023-06-09 22:40:47',1,1);
INSERT INTO `dish` VALUES (47,'Arctic Ocean Soda',11,4.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png','Still the taste of childhood',1,'2023-06-10 09:18:49','2023-06-10 09:18:49',1,1);
INSERT INTO `dish` VALUES (48,'Snowflake Beer',11,4.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png','',1,'2023-06-10 09:22:54','2023-06-10 09:22:54',1,1);
INSERT INTO `dish` VALUES (49,'Steamed Rice',12,2.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png','Selected Wuchang rice',1,'2023-06-10 09:30:17','2023-06-10 09:30:17',1,1);
INSERT INTO `dish` VALUES (50,'Bread Roll',12,1.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png','High-quality flour',1,'2023-06-10 09:34:28','2023-06-10 09:34:28',1,1);
INSERT INTO `dish` VALUES (51,'Sauerkraut Fish',20,56.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4a9cefba-6a74-467e-9fde-6e687ea725d7.png','Ingredients: Soup, grass carp, sauerkraut',1,'2023-06-10 09:40:51','2023-06-10 09:40:51',1,1);
INSERT INTO `dish` VALUES (52,'Classic Hilsa Herring',20,66.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png','Ingredients: Sauerkraut, Jiangtuan fish, hilsa',1,'2023-06-10 09:46:02','2023-06-10 09:46:02',1,1);
INSERT INTO `dish` VALUES (53,'Sichuan Boiled Grass Carp',20,38.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png','Ingredients: Grass
INSERT INTO `dish` VALUES (54,'Sautéed Baby Spinach',19,18.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png','Ingredients: Baby spinach',1,'2023-06-10 09:51:46','2023-06-10 09:51:46',1,1);
INSERT INTO `dish` VALUES (55,'Garlic Sprouts',19,18.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png','Ingredients: Garlic, sprouts',1,'2023-06-10 09:53:37','2023-06-10 09:53:37',1,1);
INSERT INTO `dish` VALUES (56,'Stir-Fried Broccoli',19,18.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png','Ingredients: Broccoli',1,'2023-06-10 09:55:44','2023-06-10 09:55:44',1,1);
INSERT INTO `dish` VALUES (57,'Spicy Cabbage Stir-Fry',19,18.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png','Ingredients: Round cabbage',1,'2023-06-10 09:58:35','2023-06-10 09:58:35',1,1);
INSERT INTO `dish` VALUES (58,'Steamed Sea Bass',18,98.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png','Ingredients: Sea bass',1,'2023-06-10 10:12:28','2023-06-10 10:12:28',1,1);
INSERT INTO `dish` VALUES (59,'Braised Pork Knuckle',18,138.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png','Ingredients: Pork knuckle',1,'2023-06-10 10:24:03','2023-06-10 10:24:03',1,1);
INSERT INTO `dish` VALUES (60,'Pork Belly with Preserved Vegetables',18,58.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png','Ingredients: Pork, preserved vegetables',1,'2023-06-10 10:26:03','2023-06-10 10:26:03',1,1);
INSERT INTO `dish` VALUES (61,'Fish Head with Chopped Chili',18,66.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png','Ingredients: Silver carp, chopped chili',1,'2023-06-10 10:28:54','2023-06-10 10:28:54',1,1);
INSERT INTO `dish` VALUES (62,'Sour Soup Bullfrog',17,88.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png','Ingredients: Fresh bullfrog, pickled vegetables',1,'2023-06-10 10:33:05','2023-06-10 10:33:05',1,1);
INSERT INTO `dish` VALUES (63,'Spicy Hot Pot Bullfrog',17,88.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png','Ingredients: Fresh bullfrog, lotus root, bamboo shoots',1,'2023-06-10 10:35:40','2023-06-10 10:35:40',1,1);
INSERT INTO `dish` VALUES (64,'Greedy Bullfrog',17,88.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png','Ingredients: Fresh bullfrog, sponge gourd, bean sprouts',1,'2023-06-10 10:37:52','2023-06-10 10:37:52',1,1);
INSERT INTO `dish` VALUES (65,'Grass Carp',16,68.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png','Ingredients: Grass carp, bean sprouts, lotus root',1,'2023-06-10 10:41:08','2023-06-10 10:41:08',1,1);
INSERT INTO `dish` VALUES (66,'Jiangtuan Fish',16,119.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png','Ingredients: Jiangtuan fish, bean sprouts, lotus root',1,'2023-06-10 10:42:42','2023-06-10 10:42:42',1,1);
INSERT INTO `dish` VALUES (67,'Hilsa Herring',16,72.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png','Ingredients: Hilsa herring, bean sprouts, lotus root',1,'2023-06-10 10:43:56','2023-06-10 10:43:56',1,1);
INSERT INTO `dish` VALUES (68,'Egg Drop Soup',21,4.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png','Ingredients: Eggs, seaweed',1,'2023-06-10 10:54:25','2023-06-10 10:54:25',1,1);
INSERT INTO `dish` VALUES (69,'Mushroom Tofu Soup',21,6.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png','Ingredients: Tofu, oyster mushrooms',1,'2023-06-10 10:55:02','2023-06-10 10:55:02',1,1);

DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `dish_id` bigint NOT NULL COMMENT 'Dish ID',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Flavor name',
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Flavor data list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Dish Flavor Relationship Table';

INSERT INTO `dish_flavor` VALUES (40,10,'Sweetness','["Sugar-free","Less sugar","Half-sugar","More sugar","Full-sugar"]');
INSERT INTO `dish_flavor` VALUES (41,7,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (42,7,'Temperature','["Hot drink","Room temperature","Ice-free","Less ice","Extra ice"]');
INSERT INTO `dish_flavor` VALUES (45,6,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (46,6,'Spiciness','["Not spicy","Mildly spicy","Medium spicy","Very spicy"]');
INSERT INTO `dish_flavor` VALUES (47,5,'Spiciness','["Not spicy","Mildly spicy","Medium spicy","Very spicy"]');
INSERT INTO `dish_flavor` VALUES (48,5,'Sweetness','["Sugar-free","Less sugar","Half-sugar","More sugar","Full-sugar"]');
INSERT INTO `dish_flavor` VALUES (49,2,'Sweetness','["Sugar-free","Less sugar","Half-sugar","More sugar","Full-sugar"]');
INSERT INTO `dish_flavor` VALUES (50,4,'Sweetness','["Sugar-free","Less sugar","Half-sugar","More sugar","Full-sugar"]');
INSERT INTO `dish_flavor` VALUES (51,3,'Sweetness','["Sugar-free","Less sugar","Half-sugar","More sugar","Full-sugar"]');
INSERT INTO `dish_flavor` VALUES (52,3,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (86,52,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (87,52,'Spiciness','["Not spicy","Mildly spicy","Medium spicy","Very spicy"]');
INSERT INTO `dish_flavor` VALUES (88,51,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (89,51,'Spiciness','["Not spicy","Mildly spicy","Medium spicy","Very spicy"]');
INSERT INTO `dish_flavor` VALUES (92,53,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (93,53,'Spiciness','["Not spicy","Mildly spicy","Medium spicy","Very spicy"]');
INSERT INTO `dish_flavor` VALUES (94,54,'Dietary Restrictions','["No onions","No garlic","No coriander"]');
INSERT INTO `dish_flavor` VALUES (95,56,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (96,57,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (97,60,'Dietary Restrictions','["No onions","No garlic","No coriander","No spicy"]');
INSERT INTO `dish_flavor` VALUES (101,66,'Spiciness','["Not spicy","Mildly spicy","Medium spicy","Very spicy"]');
INSERT INTO `dish_flavor` VALUES (102,67,'Spiciness','["Not spicy","Mildly spicy","Medium spicy","Very spicy"]');
INSERT INTO `dish_flavor` VALUES (103,65,'Spiciness','["Not spicy","Mildly spicy","Medium spicy","Very spicy"]');

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Name',
  `username` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Username',
  `password` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Password',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'Phone Number',
  `sex` varchar(2) COLLATE utf8_bin NOT NULL COMMENT 'Gender',
  `id_number` varchar(18) COLLATE utf8_bin NOT NULL COMMENT 'ID Number',
  `status` int NOT NULL DEFAULT '1' COMMENT 'Status 0: Disabled, 1: Enabled',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation Time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update Time',
  `create_user` bigint DEFAULT NULL COMMENT 'Creator',
  `update_user` bigint DEFAULT NULL COMMENT 'Editor',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Employee Information';

INSERT INTO `employee` VALUES (1,'Admin','admin','e10adc3949ba59abbe56e057f20f883e','13812312312','M','110101199001010047',1,'2023-02-15 15:51:20','2023-02-17 09:16:20',10,1);

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Name',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Image',
  `order_id` bigint NOT NULL COMMENT 'Order ID',
  `dish_id` bigint DEFAULT NULL COMMENT 'Dish ID',
  `setmeal_id` bigint DEFAULT NULL COMMENT 'Set Meal ID',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Flavor',
  `number` int NOT NULL DEFAULT '1' COMMENT 'Quantity',
  `amount` decimal(10,2) NOT NULL COMMENT 'Amount',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Order Detail Table';


DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `number` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Order Number',
  `status` int NOT NULL DEFAULT '1' COMMENT 'Order Status 1 Pending Payment 2 Waiting for Acceptance 3 Accepted 4 In Delivery 5 Completed 6 Cancelled 7 Refund',
  `user_id` bigint NOT NULL COMMENT 'User who placed the order',
  `address_book_id` bigint NOT NULL COMMENT 'Address ID',
  `order_time` datetime NOT NULL COMMENT 'Order Time',
  `checkout_time` datetime DEFAULT NULL COMMENT 'Checkout Time',
  `pay_method` int NOT NULL DEFAULT '1' COMMENT 'Payment Method 1 WeChat, 2 Alipay',
  `pay_status` tinyint NOT NULL DEFAULT '0' COMMENT 'Payment Status 0 Not Paid 1 Paid 2 Refund',
  `amount` decimal(10,2) NOT NULL COMMENT 'Total Amount',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Remark',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT 'Phone Number',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Address',
  `user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'User Name',
  `consignee` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Consignee',
  `cancel_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Reason for Cancellation',
  `rejection_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Reason for Rejection',
  `cancel_time` datetime DEFAULT NULL COMMENT 'Cancellation Time',
  `estimated_delivery_time` datetime DEFAULT NULL COMMENT 'Estimated Delivery Time',
  `delivery_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Delivery Status 1 Immediately 0 Schedule for later',
  `delivery_time` datetime DEFAULT NULL COMMENT 'Delivery Time',
  `pack_amount` int DEFAULT NULL COMMENT 'Packaging Fee',
  `tableware_number` int DEFAULT NULL COMMENT 'Number of Tableware',
  `tableware_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Tableware Quantity Status 1 As per meal 0 Choose specific number',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Order Table';

DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `category_id` bigint NOT NULL COMMENT 'Dish Category ID',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Set Meal Name',
  `price` decimal(10,2) NOT NULL COMMENT 'Set Meal Price',
  `status` int DEFAULT '1' COMMENT 'Sale Status 0: Discontinued 1: Available',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Description',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Image',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation Time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update Time',
  `create_user` bigint DEFAULT NULL COMMENT 'Creator',
  `update_user` bigint DEFAULT NULL COMMENT 'Editor',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Set Meal';

DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `setmeal_id` bigint DEFAULT NULL COMMENT 'Set Meal ID',
  `dish_id` bigint DEFAULT NULL COMMENT 'Dish ID',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Dish Name (redundant field)',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Dish Unit Price (redundant field)',
  `copies` int DEFAULT NULL COMMENT 'Number of Dishes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Set Meal-Dish Relationship';

DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Product Name',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Image',
  `user_id` bigint NOT NULL COMMENT 'User ID',
  `dish_id` bigint DEFAULT NULL COMMENT 'Dish ID',
  `setmeal_id` bigint DEFAULT NULL COMMENT 'Set Meal ID',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Flavor',
  `number` int NOT NULL DEFAULT '1' COMMENT 'Quantity',
  `amount` decimal(10,2) NOT NULL COMMENT 'Amount',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Shopping Cart';

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `openid` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'WeChat User Unique Identifier',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Name',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT 'Phone Number',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT 'Gender',
  `id_number` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID Number',
  `avatar` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'Avatar',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='User Information';
