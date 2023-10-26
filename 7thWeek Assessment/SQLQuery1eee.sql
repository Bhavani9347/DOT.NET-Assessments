Create table Passenger
(
PassengerId int Primary key not null,
ReservationID int foreign key references Reservations(ReservationId),
PassengerName varchar(30) not null,
);
go

drop table Passenger;
