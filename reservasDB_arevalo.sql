-- create a table
CREATE TABLE Hotel (
  hotelNo INTEGER PRIMARY KEY,
  hotelName VARCHAR(20),
  city VARCHAR(20)
);
CREATE TABLE Room (
  roomNo INTEGER,
  hotelNo TEXT NOT NULL,
  type TEXT NOT NULL,
  price REAL,
  CHECK (type in ("Single", "Double", "Family")),
  CHECK (price >= 10 and price <= 100),
  CHECK (roomNo >= 1 and roomNo <= 120),
  PRIMARY KEY (roomNo, hotelNo)

);
CREATE TABLE Booking (
  guestNo INTEGER,
  hotelNo TEXT NOT NULL,
  dateFrom datetime,
  dateTo datetime,
  roomNo INTEGER,
  CHECK (roomNo >= 1 and roomNo <= 120)
  PRIMARY KEY (guestNo, hotelNo, dateFrom),
  FOREIGN KEY (guestNo) REFERENCES guest,
  FOREIGN KEY (hotelNo) REFERENCES hotel,
  FOREIGN KEY (roomNo) REFERENCES room,
  CHECK (dateFrom > cast(current_date as DATE) and dateTo>=dateFrom)
  
);
CREATE TABLE Guest (
  guestNo INTEGER PRIMARY KEY,
  guestName VARCHAR(20),
  guestAddress VARCHAR(20)
);

INSERT INTO Hotel VALUES ("H001", "Cholo", "Palmira"); -- Error: near line 38: datatype mismatch
INSERT INTO Hotel VALUES ("H002", "10-60", "Cali"); -- Error: near line 39: datatype mismatch
INSERT INTO Hotel VALUES ("H003", "Space", "Bogotá"); -- Error: near line 40: datatype mismatch
INSERT INTO Hotel VALUES ("H004", "Pérgola", "Medellín"); -- Error: near line 41: datatype mismatch
INSERT INTO Hotel VALUES ("H005", "Over", "Pereira"); -- Error: near line 42: datatype mismatch
Insert into Hotel (hotelNo, hotelName, city) values (1, "Torre de Cali", "Palmira");
Insert into Hotel (hotelNo, hotelName, city) values (2, "Intercontinental", "Bogota");
Insert into Hotel (hotelNo, hotelName, city) values (3, "Casa Blanca", "Medellin");
Insert into Hotel (hotelNo, hotelName, city) values (4, "Neuchatel", "Pereira");
Insert into Hotel (hotelNo, hotelName, city) values (5, "Lord Star", "Cali");

SELECT * FROM Hotel;

INSERT INTO Room VALUES ("R001", "H001", "Sola", 250); -- Error: near line 45: CHECK constraint failed: room
INSERT INTO Room VALUES ("R002", "H002", "Double", 500); -- Error: near line 46: CHECK constraint failed: room
INSERT INTO Room VALUES ("R003", "H003", "Matrimonial", 750); -- Error: near line 47: CHECK constraint failed: room
INSERT INTO Room VALUES ("R004", "H004", "Compartida", 1600); -- Error: near line 48: CHECK constraint failed: room
INSERT INTO Room VALUES ("R005", "H005", "Doble", 1400); -- Error: near line 49: CHECK constraint failed: room
Insert into Room (roomNo, hotelNo, type, price) values (1, 1, "Family", 25);
Insert into Room (roomNo, hotelNo, type, price) values (2, 1, "Family", 30);
Insert into Room (roomNo, hotelNo, type, price) values (3, 2, "Single", 15);
Insert into Room (roomNo, hotelNo, type, price) values (4, 3, "Family", 35);
Insert into Room (roomNo, hotelNo, type, price) values (5, 4, "Double", 25);

SELECT * FROM Room;

INSERT INTO Booking VALUES ("G001", "H001", "16-feb-22", "4-mar-22", "R001"); -- Error: near line 53: CHECK constraint failed: booking
INSERT INTO Booking VALUES ("G002", "H002", "17-feb-22", "5-mar-22", "R002"); -- Error: near line 54: CHECK constraint failed: booking
INSERT INTO Booking VALUES ("G003", "H003", "18-feb-22", "6-mar-22", "R003"); -- Error: near line 55: CHECK constraint failed: booking
INSERT INTO Booking VALUES ("G004", "H004", "19-feb-22", "7-mar-22", "R004"); -- Error: near line 56: CHECK constraint failed: booking
INSERT INTO Booking VALUES ("G005", "H005", "20-feb-22", "8-mar-22", "R005"); -- Error: near line 57: CHECK constraint failed: booking
Insert into Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) values(1, 5, '2-02-2022', '28-02-2022', 2);
Insert into Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) values(3, 1, '21-02-2022', '28-02-2022', 3);
Insert into Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) values(5, 5, '22-02-2022', '28-02-2022', 5);
Insert into Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) values(2, 3, '23-02-2022', '28-02-2022', 4);
Insert into Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) values(4, 4, '24-02-2022', '28-02-2022', 3);

SELECT * FROM Booking;

INSERT INTO Guest VALUES ("G001", "Martin", "131512"); -- Error: near line 62: datatype mismatch
INSERT INTO Guest VALUES ("G002", "Gabriel", "656465"); -- Error: near line 63: datatype mismatch
INSERT INTO Guest VALUES ("G003", "Daniel", "544654");  -- Error: near line 64: datatype mismatch
INSERT INTO Guest VALUES ("G004", "Alexander", "564654");  -- Error: near line 65: datatype mismatch
INSERT INTO Guest VALUES ("G005", "Alejandro", "465465");  -- Error: near line 66: datatype mismatch
Insert into Guest (guestNo, guestName, guestAddress) values (1, "Carlos Arturo", "Calle 464");
Insert into Guest (guestNo, guestName, guestAddress) values (2, "Manuel Felipe", "Calle 125");
Insert into Guest (guestNo, guestName, guestAddress) values (3, "Maria Camila", "Calle 879");
Insert into Guest (guestNo, guestName, guestAddress) values (4, "Maria Lina", "Calle 126");
Insert into Guest (guestNo, guestName, guestAddress) values (5, "Santiago", "Calle 164");

SELECT * FROM Guest;
