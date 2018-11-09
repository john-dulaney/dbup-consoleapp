IF EXISTS(SELECT *
        FROM   dbo.Customers)
		DROP TABLE dbo.Customers

CREATE TABLE Customers
  (
  customerid int identity not null, 
  firstname varchar(50) not null, 
  lastname varchar(50) not null, 
  address1 varchar(50) not null, 
  address2 varchar(50), 
  city varchar(50) not null, 
  state varchar(50), 
  zip int, 
  country varchar(50) not null, 
  region tinyint not null,
  email varchar(50),
  phone varchar(50),
  creditcardtype tinyint not null,
  creditcard varchar(50) not null, 
  creditcardexpiration varchar(50) not null, 
  username varchar(50) not null, 
  password varchar(50) not null, 
  age tinyint, 
  income int,
  gender varchar(1)
  )
GO 