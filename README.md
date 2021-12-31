# IST-659-Database-Management-_Project

 Business Description 

 
Etsy is an e-commerce platform remarkably like Amazon. The company is still not remarkably successful and needs a digital transformation. All the orders were placed over a call and the records were maintained physically.  of their records to a well-structured Database Management System will prove to be a huge boost for their success. 
Implementation of this system will be extremely helpful to the company in many ways: 
It will help small businesses to reach out to people on a global platform. 
It will help keep a track of all the activities like orders and shipment 
It will also help to track the inventory of items that are present in the warehouse which can be retrieved and delivered to the customer easily. 
Digital transformation will also aid in getting quality feedback from the customers which will in turn help the company rectify their areas of improvement. 

Assuming the following: 
The supplier can supply multiple products and shipment at the same time. 
Same product can be supplied by a different supplier as well. 

 
Problem Statement  

E-commerce makes it simple to sell items to a vast number of people. There is, however, a lot of competitiveness among e-commerce companies as everyone wants to be the best in business. So, this project aims to develop online shopping for customers with the goal that it is extremely easy to shop for your favorite things in a seamless manner. In Etsy, all the records about procurement, vendors, and sales are kept manually or taken over the call which makes handling these massive amounts of data exceedingly difficult and on-paper records are difficult to access in an hour of need. As records of administration are kept in physical form it is hard to keep track of supplies that Etsy gets from its suppliers or the demands of the customers. Also, they cannot even find a trend in when demand or supplies are more or else and this affects their sales during peak seasons. As said, there is no proper system to plan for in-demand goods. To thrive in the e-commerce market Etsy, they need to digitally transform their entire system. If Etsy is digitally transforming, then they can take feedback from customers or suppliers which will again help them in planning procurement ahead of time and will also be able to satisfy customer demands during peak seasons. 

 

Proposed Solution 
 
With the use of this Etsy Database Management system, we can ensure an improved User experience between all the users of this system as they can view the products online and buy from the comfort of their home. Also, they will have an immense variety of products to choose from. 
This system will help to solve all the administrative problems, since it eases the storage, maintenance, and access to data records. It will also solve the problem of wasted space caused by physical records. 
It will help the sellers to keep track of all the products which have huge demand in a particular location and vice versa. Furthermore, it will help to keep track of products returned, number of products to manufacture at a particular budget. 
The users will have choice to browse products available for different locations and products can be delivered at their doorstep with the attractive “Free Home Delivery” policy.  

 
Users 

The primary end users of this database are the customers who will be using it for easier access to the various products available in the ecommerce database. Suppliers come at the other end, who use it to check product details to efficiently reach out to the warehouse and they can also see the reviews for every customer to ensure that the ratings are not below average. The administrative team can use this database management system to investigate the transactional records between customers and products and ensure all the orders are delivered and check for the available quantity of products in the warehouse. 

Potential Entities and Attributes 

CUSTOMER 
Customer ID (PK) 
Customer First name 
Customer Last Name 
Address 
Email id  
Phone number 
Customer city 
Zip code 

 
SUPPLIER 
Supplier ID (PK) 
Supplier Name 
Address 
City 
Zip code 
Email 
Phone number 

 
ORDERS 
Order ID (PK) 
Customer ID (FK) 
Shipping address 
Amount 
Status 

 
PRODUCTS 
Product ID (PK) 
Product name 
Category 
Cost 
Supplier ID (FK) 

 
RATING 
Rating_ID (PK) 
Customer ID (FK) 
Product Rating 
Product Category 

 
SHIPPING ADDRESS 
Shipping ID (PK) 
Customer ID (FK) 
City 
Zip code 


WAREHOUSES 
Warehouse ID (PK) 
Product ID (FK) 
Available quantity 
City 

 



 
