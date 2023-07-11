# database-project-george07-t
database-project-george07-t created by GitHub Classroom

Roll:1907114

Train Management System
-------------------------
The Train Management System Database is a project aimed at managing and organizing train-related information within a railway system. It provides a structured and efficient way to store, retrieve, and manage data related to users, trains, classes, routes, tickets, and payments. The database enables seamless management of train operations, ticket booking, passenger information, and financial transactions.

The project consists of several tables that are designed to capture specific aspects of the train management system. Here's an overview of the tables and their purpose:

    Users: This table stores user information such as National ID (NID), age, date of birth (DOB), username, name, and address. The NID serves as the primary key to uniquely identify each user.

    Train: The Train table contains details about different trains, including train ID, train name, departure time, available seats, destination, source, and average time. The train ID is the primary key for this table.

    Class: This table holds information about different classes available on trains. It includes class type, fare, and the associated train ID as a foreign key.

    Route: The Route table defines the stops along a train's route. It stores stop numbers, stop names, and the corresponding train ID. The stop number serves as the primary key.

    Tickets: This table manages ticket information, such as ticket number, train number, journey date, passenger name, class, source, destination, seat number, and user's NID. The ticket number is the primary key, and foreign keys are used to establish relationships with the Users and Train tables.

    Payment: The Payment table tracks payment details for tickets. It includes ticket number, card number, bank, amount, and transaction ID. The transaction ID serves as the primary key, and a foreign key references the Tickets table.
Users  Table
-----
![Screenshot (539)](https://github.com/DatabaseSystem19/database-project-george07-t/assets/68592871/7a3f9dfe-c53b-4245-8088-acd93bbecb92)

Train  Table
-----
![Screenshot (540)](https://github.com/DatabaseSystem19/database-project-george07-t/assets/68592871/669e3d77-0d0d-4fdd-ac2e-0565e7f2b885)

Class  Table
-----
![Screenshot (541)](https://github.com/DatabaseSystem19/database-project-george07-t/assets/68592871/d2f03960-df58-4a76-917a-e3c8bb664f63)

Route  Table
-----
![Screenshot (542)](https://github.com/DatabaseSystem19/database-project-george07-t/assets/68592871/fae4875b-976c-4767-96ca-b48af80d829d)

Tickets  Table
-----
![Screenshot (543)](https://github.com/DatabaseSystem19/database-project-george07-t/assets/68592871/cb93dd76-6d7e-420c-812e-0fea8970b380)

Payment  Table
-----
![Screenshot (544)](https://github.com/DatabaseSystem19/database-project-george07-t/assets/68592871/fa2ce096-68a3-4155-b061-ece102cc6a72)

The Train Management System Database project facilitates various operations, such as:

    Creating tables: The project involves creating the necessary tables with appropriate column definitions and constraints to ensure data integrity.

    Inserting data: Data can be inserted into the tables using INSERT statements. Users can be added, train details can be recorded, classes can be defined, routes can be set, tickets can be generated, and payment information can be stored.

    Querying the database: The project allows retrieving and displaying data from the tables. This includes fetching user details, train information, ticket bookings, payment history, and more.

    Performing PL/SQL operations: The database project supports writing PL/SQL code to perform complex operations, implement business logic, generate reports, and handle exceptions.

Overall, the Train Management System Database project provides a solid foundation for managing and organizing train-related data. It offers the necessary functionalities to streamline operations, improve efficiency, and enhance the passenger experience within a railway system.
