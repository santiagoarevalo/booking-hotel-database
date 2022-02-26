-- NOTE:
-- To execute the file in SQL Fiddle, it is necessary to modify 
-- the Query Terminator section, changing the [;] option by [/] (slash). 


-- Santiago Arevalo Valencia
-- Work developed in SQLFiddle
-- language and Syntax: Oracle 11g R2

Create table Hotel (
    hotelNo number(4) not null,
    hotelName varchar2(20) not null,
    city varchar2(20) not null,
    constraint pk_hotelNo primary key (hotelNo)
)/

Create table Room (
    roomNo number(4) not null,
    hotelNo number(4) not null,
    type varchar2(20) not null,
    price number(4) not null,
    constraint pk_roomNo_hotelNo primary key (roomNo, hotelNo),
    constraint fk_hotelNo foreign key (hotelNo) references Hotel(hotelNo),
    constraint cType check (type in('Single', 'Double', 'Family')),
    constraint cRoomNo check (roomNo >= 1 and roomNo <= 120),
    constraint cPrice check (price >= 10 and price <= 100)
)/

Create table Guest (
    guestNo number(4) not null,
    guestName varchar2(20) not null,
    guestAddress varchar2(20) not null,
    constraint pk_guestNo primary key (guestNo)
)/

Create table Booking (
    hotelNo number(4) not null,
    guestNo number(4) not null,
    dateFrom date not null,
    dateTo date not null,
    roomNo number(4) not null,
    constraint pk_hotelNo_guestNo_dateFrom primary key (hotelNo, guestNo, dateFrom, roomNo),
    constraint fk_hotelNoB foreign key (hotelNo) references Hotel(hotelNo),
    constraint fk_guestNo foreign key (guestNo) references Guest(guestNo),
    constraint fk_roomNo foreign key (roomNo, hotelNo) references Room(roomNo, hotelNo)
)/

create trigger datecheck before insert on booking 
for each row
begin
   if (:NEW.datefrom < SYSDATE) then
    RAISE_APPLICATION_ERROR(-20100, 'Date from must be a date in the future');
  end;
end;
/

Insert into Hotel values (1, 'Torre de Cali', 'Cali')/
Insert into Hotel values (2, 'Intercontinental', 'Cali')/
Insert into Hotel values (3, 'Casa Blanca', 'Bogota')/
Insert into Hotel values (4, 'Neuchatel', 'Medellin')/
Insert into Hotel values (5, 'Lord Star', 'Cartagena')/
Insert into Hotel values (6, 'Cholo', 'Palmira')/
Insert into Hotel values (7, '10-60', 'Cali')/
Insert into Hotel values (8, 'Space', 'Bogota')/
Insert into Hotel values (9, 'Pergola', 'Medellin')/
Insert into Hotel values (10,'Over', 'Pereira')/

Insert into Room values (1, 1, 'Family', 25)/
Insert into Room values (2, 1, 'Family', 30)/
Insert into Room values (3, 2, 'Single', 15)/
Insert into Room values (4, 3, 'Family', 35)/
Insert into Room values (5, 4, 'Double', 25)/
Insert into Room values (6, 6, 'Single', 25)/
Insert into Room values (7, 7, 'Double', 50)/
Insert into Room values (8, 8, 'Family', 75)/
Insert into Room values (9, 9, 'Double', 100)/
Insert into Room values (10, 10, 'Double', 100)/

Insert into Guest values (1, 'Carlos Arturo', 'Calle 464')/
Insert into Guest values (2, 'Manuel Felipe', 'Calle 125')/
Insert into Guest values (3, 'Maria Camila', 'Calle 879')/
Insert into Guest values (4, 'Maria Lina', 'Calle 126')/
Insert into Guest values (5, 'Santiago', 'Calle 164')/
Insert into Guest values (6, 'Martin', '131512')/
Insert into Guest values (7, 'Gabriel','656465')/
Insert into Guest values (8, 'Daniel', '544654')/
Insert into Guest values (9, 'Alexander', '564654')/
Insert into Guest values (10, 'Alejandro', '465465')/

Insert into Booking values(1, 1, TO_DATE('15/03/2022', 'DD/MM/YY'), TO_DATE('30/03/2022', 'DD/MM/YY'), 1)/
Insert into Booking values(1, 4, TO_DATE('16/03/2022', 'DD/MM/YY'), TO_DATE('01/04/2022', 'DD/MM/YY'), 2)/
Insert into Booking values(2, 5, TO_DATE('16/03/2022', 'DD/MM/YY') , TO_DATE('01/04/2022', 'DD/MM/YY'), 3)/
Insert into Booking values(3, 3, TO_DATE('17/03/2022', 'DD/MM/YY') , TO_DATE('02/04/2022', 'DD/MM/YY'), 4)/
Insert into Booking values(4, 4, TO_DATE('18/03/2022', 'DD/MM/YY') , TO_DATE('03/04/2022', 'DD/MM/YY'), 5)/
Insert into Booking values(6, 1, TO_DATE('19/03/2022', 'DD/MM/YY') , TO_DATE('04/04/2022', 'DD/MM/YY'), 6)/
Insert into Booking values(7, 2, TO_DATE('20/03/2022', 'DD/MM/YY') , TO_DATE('05/04/2022', 'DD/MM/YY'), 7)/
Insert into Booking values(8, 3, TO_DATE('21/03/2022', 'DD/MM/YY') , TO_DATE('06/04/2022', 'DD/MM/YY'), 8)/
Insert into Booking values(9, 4, TO_DATE('22/03/2022', 'DD/MM/YY') , TO_DATE('07/04/2022', 'DD/MM/YY'), 9)/
Insert into Booking values(10, 5, TO_DATE('23/03/2022', 'DD/MM/YY') , TO_DATE('08/04/2022', 'DD/MM/YY'), 10)/

Select * from Hotel;
Select * from Room;
Select * from Guest;
Select * from Booking;