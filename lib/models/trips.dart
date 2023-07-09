class Trip {
  final int id;
  final int locationFromId;
  final Locationtrip locationFrom;
  final int locationToId;
  final Locationtrip locationTo;
  final int? guestId;
  final dynamic guest;
  final int driverId;
  final Driver driver;
  final int carId;
  final Car car;
  final String? flightNumber;
  final DateTime arrivalDateTime;
  final String? arrivalDateTimeFormat;
  final int terminal;
  final String? coordinatorPhoneNumber;
  final int currentTransactionStatus;
  final String? transactionStatusName;
  final String? addedDate;
  final bool isConfirmed;
  final int? carTypeId;
  final dynamic carType;
  final int numbersOfGuest;
  final String? note;

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
    required this.arrivalDateTimeFormat,
    required this.terminal,
    required this.coordinatorPhoneNumber,
    required this.currentTransactionStatus,
    required this.transactionStatusName,
    required this.addedDate,
    required this.isConfirmed,
    required this.carTypeId,
    required this.carType,
    required this.numbersOfGuest,
    required this.note,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['Id'],
      locationFromId: json['LocationFromId'],
      locationFrom: Locationtrip.fromJson(json['LocationFrom']),
      locationToId: json['LocationToId'],
      locationTo: Locationtrip.fromJson(json['LocationTo']),
      guestId: json['GuestId'],
      guest: json['Guest'],
      driverId: json['DriverId'],
      driver: Driver.fromJson(json['Driver']),
      carId: json['CarId'],
      car: Car.fromJson(json['Car']),
      flightNumber: json['FlightNumber'],
      arrivalDateTime: DateTime.parse(json['ArrivalDateTime']),
      arrivalDateTimeFormat: json['ArrivalDateTimeFormat'],
      terminal: json['Terminal'],
      coordinatorPhoneNumber: json['CoordinatorPhonNumber'],
      currentTransactionStatus: json['CurrentTransactionStatus'],
      transactionStatusName: json['TransactionStatusName'],
      addedDate: json['AddedDate'],
      isConfirmed: json['IsConfirmed'],
      carTypeId: json['CarTypeId'],
      carType: json['CarType'],
      numbersOfGuest: json['NumbersOfGuest'],
      note: json['Note'],
    );
  }
}

class Locationtrip {
  final int id;
  final String? name;

  Locationtrip({
    required this.id,
    required this.name,
  });

  factory Locationtrip.fromJson(Map<String, dynamic> json) {
    return Locationtrip(
      id: json['Id'],
      name: json['Name'],
    );
  }
}

class Driver {
  final int id;
  final String? name;

  Driver({
    required this.id,
    required this.name,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['Id'],
      name: json['Name'],
    );
  }
}

class Car {
  final int id;
  final String? name;

  Car({
    required this.id,
    required this.name,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['Id'],
      name: json['Name'],
    );
  }
}
