class Ride {
  final int id;
  final int locationFromId;
  final Locationri locationFrom;
  final int locationToId;
  final Locationri locationTo;
  final int guestId;
  final Guest guest;
  final int driverId;
  final Driver driver;
  final int carId;
  final Car car;
  final String flightNumber;
  final DateTime arrivalDateTime;
  final int terminal;
  int currentTransactionStatus; // Added this field
  final String coordinatorPhoneNumber;

  Ride({
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
    required this.currentTransactionStatus,
    required this.coordinatorPhoneNumber,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['Id'],
      locationFromId: json['LocationFromId'],
      locationFrom: Locationri.fromJson(json['LocationFrom']),
      locationToId: json['LocationToId'],
      locationTo: Locationri.fromJson(json['LocationTo']),
      guestId: json['GuestId'],
      guest: Guest.fromJson(json['Guest']),
      driverId: json['DriverId'],
      driver: Driver.fromJson(json['Driver']),
      carId: json['CarId'],
      car: Car.fromJson(json['Car']),
      flightNumber: json['FlightNumber'],
      arrivalDateTime: DateTime.parse(json['ArrivalDateTime']),
      terminal: json['Terminal'],
      currentTransactionStatus:
          json['CurrentTransactionStatus'], // Added this field
      coordinatorPhoneNumber: json['CoordinatorPhonNumber'],
    );
  }
}

class Locationri {
  final int id;
  final String name;

  Locationri({required this.id, required this.name});

  factory Locationri.fromJson(Map<String, dynamic> json) {
    return Locationri(
      id: json['Id'],
      name: json['Name'],
    );
  }
}

class Guest {
  final int id;
  final String name;

  Guest({required this.id, required this.name});

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['Id'],
      name: json['Name'],
    );
  }
}

class Driver {
  final int id;
  final String name;

  Driver({required this.id, required this.name});

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['Id'],
      name: json['Name'],
    );
  }
}

class Car {
  final int id;
  final String name;

  Car({required this.id, required this.name});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['Id'],
      name: json['Name'],
    );
  }
}
