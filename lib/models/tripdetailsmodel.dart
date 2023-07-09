class LocationDetails {
  int id;
  String name;

  LocationDetails({required this.id, required this.name});

  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      LocationDetails(
        id: json['Id'],
        name: json['Name'],
      );
}

class Guest {
  int id;
  String name;
  String surName;
  // Add other properties as needed

  Guest({required this.id, required this.name, required this.surName});

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json['Id'],
        name: json['Name'],
        surName: json['SurName'],
        // Initialize other properties
      );
}

class TransactionDetail {
  int id;
  int transactionId;
  Guest guest;
  int guestId;
  String arrivalDateTime;
  // Add other properties as needed

  TransactionDetail({
    required this.id,
    required this.transactionId,
    required this.guest,
    required this.guestId,
    required this.arrivalDateTime,
    // Initialize other properties
  });

  factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
      TransactionDetail(
        id: json['Id'],
        transactionId: json['TrasnactionId'],
        guest: Guest.fromJson(json['Guest']),
        guestId: json['GuestId'],
        arrivalDateTime: json['ArrivalDateTime'],
        // Initialize other properties
      );
}

class Transaction {
  int id;
  int locationFromId;
  LocationDetails locationFrom;
  int locationToId;
  LocationDetails locationTo;
  int? guestId;
  Guest? guest;
  int driverId;
  Driver driver;
  int carId;
  Car car;
  String? flightNumber;
  String? arrivalDateTime;
  int terminal;
  int currentTransactionStatus;
  String? coordinatorPhoneNumber;
  String? plateNumber;
  String? note;
  bool isDeleted;
  bool isConfirmed;
  List<TransactionDetail> transactionDetails;
  String? transactionStatusName;
  int numbersOfGuest;
  int? carTypeId;
  // Add other properties as needed

  Transaction({
    required this.id,
    required this.locationFromId,
    required this.locationFrom,
    required this.locationToId,
    required this.locationTo,
    this.guestId,
    this.guest,
    required this.driverId,
    required this.driver,
    required this.carId,
    required this.car,
    required this.flightNumber,
    required this.arrivalDateTime,
    required this.terminal,
    required this.currentTransactionStatus,
    required this.coordinatorPhoneNumber,
    required this.plateNumber,
    required this.note,
    required this.isDeleted,
    required this.isConfirmed,
    required this.transactionDetails,
    required this.transactionStatusName,
    required this.numbersOfGuest,
    this.carTypeId,
    // Initialize other properties
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['Id'],
        locationFromId: json['LocationFromId'],
        locationFrom: LocationDetails.fromJson(json['LocationFrom']),
        locationToId: json['LocationToId'],
        locationTo: LocationDetails.fromJson(json['LocationTo']),
        guestId: json['GuestId'],
        guest: json['Guest'] != null ? Guest.fromJson(json['Guest']) : null,
        driverId: json['DriverId'],
        driver: Driver.fromJson(json['Driver']),
        carId: json['CarId'],
        car: Car.fromJson(json['Car']),
        flightNumber: json['FlightNumber'],
        arrivalDateTime: json['ArrivalDateTime'],
        terminal: json['Terminal'],
        currentTransactionStatus: json['CurrentTransactionStatus'],
        coordinatorPhoneNumber: json['CoordinatorPhonNumber'],
        plateNumber: json['PlateNumber'],
        note: json['Note'],
        isDeleted: json['IsDeleted'],
        isConfirmed: json['IsConfirmed'],
        transactionDetails: List<TransactionDetail>.from(
            json['TransactionDetails']
                .map((x) => TransactionDetail.fromJson(x))),
        transactionStatusName: json['TransactionStatusName'],
        numbersOfGuest: json['NumbersOfGuest'],
        carTypeId: json['CarTypeId'],
        // Initialize other properties
      );
}

class Driver {
  int id;
  String name;

  Driver({required this.id, required this.name});

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json['Id'],
        name: json['Name'],
      );
}

class Car {
  int id;
  String name;

  Car({required this.id, required this.name});

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json['Id'],
        name: json['Name'],
      );
}
