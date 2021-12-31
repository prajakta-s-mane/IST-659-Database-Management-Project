use Demo 
go

-- Down

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_warehouses_warehouse_product_id')
    alter table warehouses drop constraint fk_warehouses_warehouse_product_id

drop table if exists warehouses

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_shipping_address_shipping_customer_id')
    alter table Shipping_address drop constraint fk_shipping_address_shipping_customer_id

drop table if exists Shipping_address


if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_ratings_rating_customer_id ')
    alter table ratings drop constraint fk_ratings_rating_customer_id 

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_ratings_rating_product_id ')
    alter table ratings drop constraint fk_ratings_rating_product_id 


drop table if exists ratings


if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_orders_order_customer_id')
    alter table orders drop constraint fk_orders_order_customer_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_orders_order_product_id')
    alter table orders drop constraint fk_orders_order_product_id 

drop table if exists orders


if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_products_product_supplier_id')
    alter table products drop constraint fk_products_product_supplier_id 

drop table if exists products


drop table if exists suppliers

drop table if exists customers


GO
-- UP Metadata

create table customers (
    customer_id int not null,
    customer_first_name varchar(20) not null,
    customer_last_name varchar(20) not null,
    customer_address varchar(200) not null,
    customer_email varchar(20) not null,
    customer_phone_number int not null,
    customer_city varchar(20) not null,
    customer_zip_code int not null, 
    constraint pk_customers_customer_id primary key (customer_id),
    constraint u_customer_email unique (customer_email)
)

create table suppliers (
    supplier_id int  not null,
    supplier_name varchar(20) not null,
    supplier_address varchar(200) not null,
    supplier_city varchar(20) not null,
    supplier_zip_code int not null,
    supplier_email varchar(20) not null,
    supplier_phone_no int not null,
    constraint pk_suppliers_supplier_id primary key(supplier_id),
    constraint u_supplier_email unique(supplier_email)
)

create table orders (
    order_id int  not null,
    order_customer_id int not null,
    order_shipping_address varchar(200) not null,
    order_product_id int not null,
    order_order_date date not null,
    order_amount money not null,
    order_status varchar(20) not null,
    constraint pk_orders_order_id primary key(order_id)

)

create table products (
    product_id int not null,
    product_supplier_id int not null,
    product_name varchar(20) not null,
    product_category varchar(20) not null,
    product_cost money not null,
    constraint pk_products_product_id primary key(product_id)

)

alter table orders 
    add constraint fk_orders_order_customer_id foreign key (order_customer_id)
        references customers(customer_id)

alter table orders
    add constraint fk_orders_order_product_id foreign key(order_product_id )
        references products(product_id)

alter table products 
    add constraint fk_products_product_supplier_id foreign key (product_supplier_id)
        references suppliers(supplier_id)


create table ratings (
    rating_id int identity not null, --surrogate
    rating_customer_id int not null,
	rating_product_id int not null,
    rating_product_rating int not null,
    constraint pk_ratings_rating_id primary key(rating_id)
)

alter table ratings 
    add constraint fk_ratings_rating_customer_id foreign key (rating_customer_id)
        references customers(customer_id)


create table shipping_address (
    shipping_id int not null,
    shipping_customer_id int not null,    
    shipping_city varchar(20) not null,
    shipping_zip_code int not null,
    constraint pk_shipping_address_shipping_id primary key(shipping_id)
)

alter table shipping_address 
    add constraint fk_shipping_address_shipping_customer_id foreign key (shipping_customer_id)
        references customers(customer_id)

create table warehouses (
    warehouse_id int not null,
    warehouse_product_id int not null,
    warehouse_available_quantity int not null,
    warehouse_state char(2) not null, --Check constraint
    constraint pk_warehouses_warehouse_id_product_id primary key(warehouse_id,warehouse_product_id)
)

alter table warehouses 
    add constraint fk_warehouses_warehouse_product_id foreign key (warehouse_product_id)
        references products(product_id)

-- UP DATA
-- Insert Queries

-- customers

Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (101,'Abby','Watson','Flat 5, 67 George Downing Estate, London,N16 6BQ','awatson@gmail.com',183873499,'Boston',13210);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (102,'Kayla','Gandel','171 Great Ducie Street','kgandel@gmail.com',605199075,'Malibu',36578);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (103,'Bryce','White','3 Norman Cottages, Michaelston','bwhite@gmail.com',863214451,'New York',21560);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (104,'Debbie','Black','5 Caravel Mews','dblack@gmail.com',937346679,'New Jersey',21570);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (105,'John','Ellis','Folly Barn Cottage','jellis@gmailcom',267815990,'Syracuse',13687);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (106,'Adison','Shepherd','Ground Floor And Basement Premises','ashepherd@gmail.com',110463848,'Harrison',53795);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (107,'Chase','Jackson','19 Redington Gardens','cjackson@gmail.com',795179478,'Malibu',36578);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (108,'Eliza','Gray','85 Cedar Avenue','egray@gmail.com',138568487,'Malibu',36578);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (109,'Ryan','Brayer','Flat 15, Cathedral Court','rbrayer@hotmail.com',242040555,'Boston',13210);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (110,'Noah','Johnson','35 Ferryhill Road','njohnson@syr.edu',470822296,'New Jersey',21570);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (111,'Jack','Claire','51 Thompson Street','jack@syr.edu',310317430,'Syracuse',13687);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (112,'Shane','Yang','52 Addiscombe Road','shaney@syr.edu',889315362,'Harrison',53795);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (113,'Sean','Mendes','31 Church Street','seanm@gmail.com',828357888,'New York',21560);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (114,'Chris','Wilson','Ormond House, 63 Queen Victoria Street','chrisw@yahoo.com',732820238,'New Jersey',21570);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (115,'Steven','Kepner','3 Selside, Wigan','skepner@syr.edu',455365287,'Syracuse',13687);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (116,'Mark','Robinson','The Cottage, Station Road','mrobi@outlook.com',170864927,'New Jersey',21570);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (117,'Bryan','Avery','4 Sandhurst Road','bavery@hotmain.com',311461546,'Harrison',53795);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (118,'Harry','Smith','Blaen Y Cwm','hsmith@yahoo.com',533876005,'Boston',13210);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (119,'Emma','Riggs','46 Green Lane','eriggs@outlook.com',949337226,'New York',21560);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (120,'Ron','Flores','4A Holly Hill Road','rflores@syr.edu',326038781,'Harrison',53795);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (121,'Hermonie','Granger','118 Hampton Park Road','hgranger@gmail.com',833372450,'Syracuse',13687);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (122,'Izzie','Burke','12 Lon Lindys, Rhoose','iburke@outlook.com',900562835,'Harrison',53795);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (123,'Ingrid','Hall','25 Winstanley Road','ihall@syr.edu',768700484,'Syracuse',13687);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (124,'Mike','Damon','14 Club Street','mdamon@outlook.com',842667014,'Malibu',36578);
Insert into dbo.customers (customer_id,customer_first_name,customer_last_name,customer_address,customer_email,customer_phone_number,customer_city,customer_zip_code) values (125,'Paul','Pratt','65 Goldington Road','ppratt@outlook.com',751392973,'New Jersey',21570);

-- suppliers 

Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (201,'Rick','46553 Valley Ct #6014, Lexington Park','Los Angeles',56740,'rick@gmail.com',215070097);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (202,'Jamie','331 Skyline Lakes, Dumrils','Dallas',12340,'jamie@gmail.com',152670476);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (203,'Matt','700 Jenkisson Ave, Lake Bluff','New York',43567,'matt@gmail.com',378298558);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (204,'Patrick','2122 Sheffield Dr, Jackson','Rochester',34875,'patrick@gmail.com',986151362);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (205,'Adam',' 2363 Masonic Drive','San Diego',12309,'adam@gmail.com',734442585);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (206,'Peter','3419 Crestview Manor','Dallas',12340,'peter@gmail.com',801351752);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (207,'Tom','3912 Ferry Street','San Diego',12309,'tom@syr.edu',938555121);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (208,'Ryan','2289 Brookside Drive','Los Angeles',56740,'ryan@syr.edu',187288237);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (209,'Chris',' 2777 Norma Lane','New York',43567,'chris@yahoo.com',579304857);
Insert into dbo.suppliers (supplier_id,supplier_name,supplier_address,supplier_city,supplier_zip_code,supplier_email,supplier_phone_no) values (210,'Nick','838 Webster Street','Rochester',34875,'nick@hotmail.com',645273435);

-- products

Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (401,201,'Phone','Electronics',17);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (402,209,'Laptop','Electronics',77);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (403,204,'TV','Electronics',81);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (404,209,'Earphones','Electronics',45);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (405,203,'Watch','Electronics',65);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (406,206,'T-Shirt','Clothing',19);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (407,210,'Shirt','Clothing',96);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (408,208,'Pants','Clothing',49);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (409,206,'Cap','Clothing',75);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (410,205,'Jackets','Clothing',53);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (411,201,'Sofa Set','Home & living',52);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (412,209,'Lamps','Home & living',56);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (413,209,'Chairs','Home & living',82);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (414,206,'Dining Table','Home & living',68);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (415,203,'Carpet','Home & living',25);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (416,206,'Paints','Crafts',97);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (417,201,'Color Pencil','Crafts',54);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (418,209,'Canvas','Crafts',68);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (419,210,'Markers','Crafts',49);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (420,206,'Paint Paper','Crafts',93);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (421,204,'Fidget Spinner','Toys',23);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (422,210,'Toy Train','Toys',38);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (423,202,'Puzzles','Toys',60);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (424,210,'Marbles','Toys',83);
Insert into dbo.products(product_id,product_supplier_id,product_name,product_category,product_cost) values (425,205,'Lego set','Toys',66);

-- orders

Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (301,101,'Flat 5, 67 George Downing Estate, London,N16 6BQ',420,'06/14/2020',152,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (302,103,'3 Norman Cottages, Michaelston',423,'01/03/2018',232,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (303,125,'65 Goldington Road, Bedford,MK40 3NB',406,'05/28/2018',321,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (304,110,'35 Ferryhill Road',407,'05/05/2016',335,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (305,123,'25 Winstanley Road, Liverpool,L22 4QN',402,'05/26/2019',446,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (306,108,'85 Cedar Avenue',420,'05/21/2020',260,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (307,105,'Folly Barn Cottage',420,'02/27/2019',281,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (308,115,'3 Selside, Wigan',415,'10/28/2018',190,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (309,121,'118 Hampton Park Road, Hereford,HR1 1US',411,'05/30/2020',346,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (310,101,'Flat 5, 67 George Downing Estate, London,N16 6BQ',409,'06/02/2016',95,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (311,103,'3 Norman Cottages, Michaelston',414,'12/14/2018',358,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (312,106,'Ground Floor And Basement Premises',416,'10/04/2019',354,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (313,101,'Flat 5, 67 George Downing Estate, London,N16 6BQ',416,'08/07/2019',21,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (314,103,'3 Norman Cottages, Michaelston',423,'07/03/2016',438,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (315,121,'118 Hampton Park Road, Hereford,HR1 1US',416,'10/11/2019',12,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (316,116,'The Cottage, Station Road',404,'07/16/2019',212,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (317,114,'Ormond House, 63 Queen Victoria Street',419,'10/05/2020',300,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (318,114,'Ormond House, 63 Queen Victoria Street',402,'01/24/2019',269,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (319,105,'Folly Barn Cottage',420,'08/18/2017',330,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (320,118,'Blaen Y Cwm',410,'05/16/2019',334,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (321,113,'31 Church Street',409,'11/04/2020',103,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (322,102,'171 Great Ducie Street',404,'11/13/2016',493,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (323,104,'5 Caravel Mews',410,'02/29/2020',244,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (324,102,'171 Great Ducie Street',415,'04/23/2016',482,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (325,118,'Blaen Y Cwm',415,'09/22/2020',494,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (326,122,'12 Lon Lindys, Rhoose',409,'05/28/2016',224,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (327,123,'25 Winstanley Road',402,'05/11/2020',459,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (328,120,'4A Holly Hill Road',418,'10/28/2016',230,'active');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (329,110,'35 Ferryhill Road',408,'01/07/2017',234,'completed');
Insert into dbo.orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status) values (330,123,'25 Winstanley Road',418,'12/17/2018',142,'active');

-- ratings

Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (108,402,'1');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (107,420,'3');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (105,419,'1');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (114,407,'2');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (109,413,'2');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (121,403,'3');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (101,423,'3');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (125,422,'2');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (106,408,'2');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (102,423,'2');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (105,424,'3');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (123,425,'1');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (113,414,'1');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (119,404,'5');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (109,420,'1');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (119,417,'4');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (104,405,'2');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (125,406,'4');
Insert into dbo.ratings(rating_customer_id,rating_product_id,rating_product_rating) values (112,424,'3');

-- shipping_address

Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (601,125,'New Jersey',21570);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (602,120,'Harrison',53795);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (603,124,'Malibu',36578);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (604,115,'Syracuse',13687);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (605,111,'Syracuse',13687);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (606,109,'Boston',13210);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (607,116,'New Jersey',21570);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (608,107,'Malibu',36578);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (609,110,'New Jersey',21570);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (610,117,'Harrison',53795);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (611,125,'New Jersey',21570);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (612,104,'New Jersey',21570);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (613,123,'Syracuse',13687);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (614,107,'Malibu',36578);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (615,124,'Malibu',36578);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (616,109,'Boston',13210);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (617,117,'Harrison',53795);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (618,117,'Harrison',53795);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (619,117,'Harrison',53795);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (620,101,'Boston',13210);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (621,108,'Malibu',36578);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (622,123,'Syracuse',13687);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (623,125,'New Jersey',21570);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (624,102,'Malibu',36578);
Insert into dbo.shipping_address (shipping_id,shipping_customer_id,shipping_city,shipping_zip_code) values (625,103,'New York',21560);

-- warehouses

Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (801,403,42,'NJ');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (802,404,91,'NY');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (803,405,66,'CA');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (804,406,38,'TX');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (805,407,79,'MA');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (806,408,11,'TX');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (807,409,25,'WA');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (808,410,75,'NY');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (809,411,94,'GA');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (801,412,22,'NJ');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (802,408,10,'NJ');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (803,409,54,'NY');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (804,410,34,'CA');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (805,411,89,'TX');
Insert into dbo.warehouses (warehouse_id,warehouse_product_id,warehouse_available_quantity,warehouse_state) values (806,412,45,'MA');

-- Verify

select * from customers
select * from suppliers 
select * from orders 
select * from products 
select * from ratings 
select * from shipping_address 
select * from warehouses 


-- Functionalities


-- 1 
--Display Customers who have orders in progress and have order amount above $300 

select c.customer_first_name + ' ' + c.customer_last_name as customer_name, o.order_status, o.order_amount 
from customers c 
join orders o on o.order_customer_id=c.customer_id 
where o.order_amount > 300 and o.order_status='active' 
group by o.order_status, c.customer_first_name, c.customer_last_name, o.order_amount 
order by o.order_amount DESC 

--2 
--Which category of products have maximum ratings

SELECT  r.rating_product_rating, count(r.rating_product_rating) as rating_count, p.product_category 
from ratings r 
right join products p on p.product_id=r.rating_product_id 
group by p.product_category,  r.rating_product_rating 


-- 3  
--  Create a report to fetch details of products being supplied and also from which warehouse. 
--  Also display the available quantity of the products in the warehouse

select p.product_id, p.product_name, s.supplier_name,w.warehouse_product_id, w.warehouse_available_quantity, w.warehouse_state 
from products p 
join warehouses w on w.warehouse_product_id=p.product_id 
join suppliers s on s.supplier_id=p.product_supplier_id 
where w.warehouse_available_quantity > 0


-- 4 
--Create a report of all the products that has not been rated even once.

select product_id, product_name, product_category, rating_product_rating 
from products p  
    left JOIN ratings r  
on r.rating_product_id = p.product_id 
where rating_product_rating is NULL 

-- 5 

-- 5.1
--Display all the customers and cities having a valid shipping id. Which customers do not have a shipping id? 

select * 
from shipping_address s 
RIGHT join customers c on c.customer_id=s.shipping_customer_id 
order by c.customer_id 

-- 5.2
--Find products from all categories which do not have a rating

SELECT p.product_name, r.rating_product_rating, p.product_category 
from ratings r 
right join products p on p.product_id=r.rating_product_id 
group by r.rating_product_rating, p.product_name, p.product_category 


-- 6 
--Generate a report of products in Electronics category from lowest to highest 

select product_id, product_name, product_category,product_cost 
from products 
WHERE product_category='Electronics' 
order by product_cost ASC 
 

-- 7 
--  Create a statistical report showing Product category wise number of products, minimum, maximum and average cost
--  of the products

select 
product_category, 
count(product_category) as count_product_category, 
MIN(product_cost) as min_product_cost,  
max(product_cost) as max_product_cost, 
AVG(product_cost) as avg_product_cost 
from products 
GROUP BY product_category 
order by product_category 

--8
--Pivot table
--Apply Pivot and Unpivot to products table

 select product_name, Electronics, Clothing, Toys
 from products
 pivot(
     sum(product_cost) for product_category in (Electronics, Clothing, Toys)
 ) as PivotTable


--Unpivot Table

SELECT  product_name, product_category,price
FROM 
(
SELECT product_name, Electronics, Clothing, Toys from products 
PIVOT 
( 
SUM(product_cost) FOR product_category in (Electronics, Clothing, Toys) 
) AS PivotTable
) P 
UNPIVOT 
( 
price FOR product_category in (Electronics, Clothing, Toys)
) 
AS UnpivotTable


-- 9

--Find customers having order amount greater than a certain amount. Where order id is 301 using subquery 

SELECT c.customer_id,c.customer_first_name, o.order_amount 
from customers c, orders o 
where c.customer_id=o.order_customer_id and o.order_amount> 
(select order_amount 
from orders 
where order_id='301') 

-- 10 

--10.1
--  Create a report to show ranking of products sold with respect to sales in each category. 
--  Display Product category,Product Name, Product ID, total sales of product and rank.  

SELECT  
p.product_category, 
p.product_name, 
o.order_product_id,  
sum(o.order_amount) as total_sales, 
rank() over (partition by p.product_category order by sum(o.order_amount) desc) as Rank_prod 
FROM orders o 
join 
products p 
on o.order_product_id = p.product_id 
group by  
p.product_category, 
p.product_name, 
o.order_product_id 
order by  
p.product_category asc, sum(o.order_amount) desc 

--10.2
-- Create a report showing the sequence of orders placed till date in each category. 
-- Display Product Name, Product ID, product category, order date and order amount 

select 
product_name, 
product_id, 
product_category, 
order_order_date, 
order_amount, 
row_number() over(partition by product_id order by order_order_date) as order_order  
from products p  
JOIN orders o  
ON p.product_id = o. order_product_id 
order by product_id 

-- 11 
-- Display customers who stay in Malibu or Boston. Display Full name of the customer.

select customer_first_name + ' ' + customer_last_name as customer_name, customer_city
from customers  
where customer_city in ('Boston' , 'Malibu')

-- 12 
--Find out average amount for every product category. (Use with)

with order_amount as 
(
SELECT
     p.product_category as p_cat, o.order_amount as avg_amount
FROM products p 
join orders o on o.order_product_id=p.product_id
)
select p_cat, avg(avg_amount) as category_average_amount
 from order_amount
group by p_cat


-- 13 
-- Generate a report on ratings of products. Create a column based on ratings categorizing it as Good, Avg, Bad

select  
product_id,  
product_name,  
product_category,  
rating_product_rating,  
customer_first_name + ' ' + customer_last_name as customer_fullname, 
Case  
    when rating_product_rating IN (1,2)THEN 'BAD' 
    when rating_product_rating IN (3,4) THEN 'AVG' 
    ELSE 'GOOD' 
END AS rating_category 
from products p 
JOIN ratings r 
on p.product_id = r.rating_product_id 
JOIN customers c  
on c.customer_id = r.rating_customer_id 

--14
--Find out products having orders between january and may of 2020

select order_id, p.product_name, order_order_date
 from orders o 
join products p on o.order_product_id=p.product_id
where o.order_order_date BETWEEN '2020-01-01' and  '2020-05-31'
order by o.order_order_date

-- 15  - Display customer details that live in Boston or Syracuse. Display customers Full Name and Use UNION

select customer_first_name + ' ' + customer_last_name as customer_name ,customer_email,customer_city from customers 
where customer_city = 'Boston' 
UNION 
select customer_first_name + ' ' + customer_last_name as Customer_name,customer_email,customer_city from customers 
where customer_city = 'Syracuse' 

-- 16 
-- Create a procedure to insert values in the orders table for every new order placed

drop PROCEDURE if EXISTS o_insert_orders
GO
CREATE PROCEDURE o_insert_orders
(
    @order_id as int,
    @order_customer_id as int,
    @order_shipping_address as varchar(200),
    @order_product_id as int,
    @order_order_date as date,
    @order_amount as money,
    @order_status as varchar(20)
) as

BEGIN
    INSERT into orders (order_id,order_customer_id,order_shipping_address,order_product_id,order_order_date,order_amount,order_status)
    VALUES (@order_id ,@order_customer_id,@order_shipping_address,@order_product_id,@order_order_date,@order_amount,@order_status)
END
GO

exec o_insert_orders @order_id= 331, @order_customer_id = 110, @order_shipping_address = '35 Ferryhill Road', @order_product_id = 418,
@order_order_date = '12/01/2021', @order_amount = 550, @order_status = 'active'
go

select * from orders order by order_id desc

-- 17 
--Create a function that returns customer ID, and concats customer First and Last Name

drop FUNCTION if EXISTS c_concat
GO
CREATE FUNCTION c_concat (@c_fname VARCHAR(200),@c_lname VARCHAR(200))
RETURNS VARCHAR(200)
AS BEGIN
RETURN (@c_fname + ' ' + @c_lname )
End
GO

select customer_id,dbo.c_concat(customer_first_name,customer_last_name)
from customers


-- 18 
-- Create a view for customers table who have their customer ID between 101 and 112   

create view temp_cust
as
select customer_id, customer_first_name
from customers
where customer_id BETWEEN 101 and 112

select * from temp_cust

-- 19 
-- Add a column in orders. Create a trigger to show the status of order

select * from orders where order_id=301 -- Checking value in DB before the trigger ran

ALTER TABLE orders
add order_stat char(1) 
GO

drop TRIGGER if EXISTS o_trigger_update
GO

CREATE TRIGGER o_trigger_update
on orders
after UPDATE
as BEGIN
if UPDATE(order_status) BEGIN
UPDATE orders set order_stat = 
Case
when order_status = 'active' then 'N'
when order_status = 'completed' then 'Y'
End
END
END

update orders set order_status = 'completed' where order_id=301
select * from orders where order_id=301 -- Checking the value change after the trigger ran