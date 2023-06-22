class Trip {
  int id;
  int locationFromId;
  LocationTrip locationFrom;
  int locationToId;
  LocationTrip locationTo;
  int guestId;
  Guest guest;
  int driverId;
  Driver driver;
  int carId;
  Car car;
  String flightNumber;
  DateTime arrivalDateTime;
  int terminal;
  String coordinatorPhoneNumber;

  Trip({
    required this.id,
    required this.locationFromId,
    required this.locationFrom,
    required this.locationToId,
    required this.locationTo,
    required this.guestId,
    required this.guest,
    required this.driverId,
    required this.driver,
    required this.carId,
    required this.car,
    required this.flightNumber,
    required this.arrivalDateTime,
    required this.terminal,
    required this.coordinatorPhoneNumber,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['Id'] as int,
      locationFromId: json['LocationFromId'] as int,
      locationFrom:
          LocationTrip.fromJson(json['LocationFrom'] as Map<String, dynamic>),
      locationToId: json['LocationToId'] as int,
      locationTo:
          LocationTrip.fromJson(json['LocationTo'] as Map<String, dynamic>),
      guestId: json['GuestId'] as int,
      guest: Guest.fromJson(json['Guest'] as Map<String, dynamic>),
      driverId: json['DriverId'] as int,
      driver: Driver.fromJson(json['Driver'] as Map<String, dynamic>),
      carId: json['CarId'] as int,
      car: Car.fromJson(json['Car'] as Map<String, dynamic>),
      flightNumber: json['FlightNumber'] as String,
      arrivalDateTime: DateTime.parse(json['ArrivalDateTime'] as String),
      terminal: json['Terminal'] as int,
      coordinatorPhoneNumber: json['CoordinatorPhonNumber'] as String,
    );
  }
}

class LocationTrip {
  int id;
  String name;

  LocationTrip({required this.id, required this.name});

  factory LocationTrip.fromJson(Map<String, dynamic> json) {
    return LocationTrip(
      id: json['Id'] as int,
      name: json['Name'] as String,
    );
  }
}

class Guest {
  int id;
  String name;

  Guest({required this.id, required this.name});

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['Id'] as int,
      name: json['Name'] as String,
    );
  }
}

class Driver {
  int id;
  String name;

  Driver({required this.id, required this.name});

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['Id'] as int,
      name: json['Name'] as String,
    );
  }
}

class Car {
  int id;
  String name;

  Car({required this.id, required this.name});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['Id'] as int,
      name: json['Name'] as String,
    );
  }
}
