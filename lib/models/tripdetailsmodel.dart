class Transaction {
  int? id;
  int? locationFromId;
  LocationDetails? locationFrom;
  int? locationToId;
  LocationDetails? locationTo;
  dynamic guestId;
  dynamic guest;
  int? companyId;
  dynamic company;
  int? driverId;
  LocationDetails? driver;
  dynamic carId;
  dynamic car;
  String? flightNumber;
  String? arrivalDateTime;
  int? terminal;
  int? currentTransactionStatus;
  dynamic coordinatorPhonNumber;
  String? plateNumber;
  String? note;
  bool? isDeleted;
  bool? isConfirmed;
  List<TransactionDetail>? transactionDetails;
  String? transactionStatusName;
  int? numbersOfGuest;
  int? carTypeId;
  dynamic carType;

  Transaction(
      {this.id,
      this.locationFromId,
      this.locationFrom,
      this.locationToId,
      this.locationTo,
      this.guestId,
      this.guest,
      this.companyId,
      this.company,
      this.driverId,
      this.driver,
      this.carId,
      this.car,
      this.flightNumber,
      this.arrivalDateTime,
      this.terminal,
      this.currentTransactionStatus,
      this.coordinatorPhonNumber,
      this.plateNumber,
      this.note,
      this.isDeleted,
      this.isConfirmed,
      this.transactionDetails,
      this.transactionStatusName,
      this.numbersOfGuest,
      this.carTypeId,
      this.carType});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    locationFromId = json['LocationFromId'];
    locationFrom = json['LocationFrom'] != null
        ? new LocationDetails.fromJson(json['LocationFrom'])
        : null;
    locationToId = json['LocationToId'];
    locationTo = json['LocationTo'] != null
        ? new LocationDetails.fromJson(json['LocationTo'])
        : null;
    guestId = json['GuestId'];
    guest = json['Guest'];
    companyId = json['CompanyId'];
    company = json['Company'];
    driverId = json['DriverId'];
    driver = json['Driver'] != null
        ? new LocationDetails.fromJson(json['Driver'])
        : null;
    carId = json['CarId'];
    car = json['Car'];
    flightNumber = json['FlightNumber'];
    arrivalDateTime = json['ArrivalDateTime'];
    terminal = json['Terminal'];
    currentTransactionStatus = json['CurrentTransactionStatus'];
    coordinatorPhonNumber = json['CoordinatorPhonNumber'];
    plateNumber = json['PlateNumber'];
    note = json['Note'];
    isDeleted = json['IsDeleted'];
    isConfirmed = json['IsConfirmed'];
    if (json['TransactionDetails'] != null) {
      transactionDetails = <TransactionDetail>[];
      json['TransactionDetails'].forEach((v) {
        transactionDetails!.add(new TransactionDetail.fromJson(v));
      });
    }
    transactionStatusName = json['TransactionStatusName'];
    numbersOfGuest = json['NumbersOfGuest'];
    carTypeId = json['CarTypeId'];
    carType = json['CarType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['LocationFromId'] = this.locationFromId;
    if (this.locationFrom != null) {
      data['LocationFrom'] = this.locationFrom!.toJson();
    }
    data['LocationToId'] = this.locationToId;
    if (this.locationTo != null) {
      data['LocationTo'] = this.locationTo!.toJson();
    }
    data['GuestId'] = this.guestId;
    data['Guest'] = this.guest;
    data['CompanyId'] = this.companyId;
    data['Company'] = this.company;
    data['DriverId'] = this.driverId;
    if (this.driver != null) {
      data['Driver'] = this.driver!.toJson();
    }
    data['CarId'] = this.carId;
    data['Car'] = this.car;
    data['FlightNumber'] = this.flightNumber;
    data['ArrivalDateTime'] = this.arrivalDateTime;
    data['Terminal'] = this.terminal;
    data['CurrentTransactionStatus'] = this.currentTransactionStatus;
    data['CoordinatorPhonNumber'] = this.coordinatorPhonNumber;
    data['PlateNumber'] = this.plateNumber;
    data['Note'] = this.note;
    data['IsDeleted'] = this.isDeleted;
    data['IsConfirmed'] = this.isConfirmed;
    if (this.transactionDetails != null) {
      data['TransactionDetails'] =
          this.transactionDetails!.map((v) => v.toJson()).toList();
    }
    data['TransactionStatusName'] = this.transactionStatusName;
    data['NumbersOfGuest'] = this.numbersOfGuest;
    data['CarTypeId'] = this.carTypeId;
    data['CarType'] = this.carType;
    return data;
  }
}

class LocationDetails {
  int? id;
  String? name;

  LocationDetails({this.id, this.name});

  LocationDetails.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}

class TransactionDetail {
  int? id;
  int? trasnactionId;
  Guest? guest;
  int? guestId;
  String? arrivalDateTime;
  dynamic addedDate;
  dynamic lastUpdatedDate;
  bool? isDeleted;

  TransactionDetail(
      {this.id,
      this.trasnactionId,
      this.guest,
      this.guestId,
      this.arrivalDateTime,
      this.addedDate,
      this.lastUpdatedDate,
      this.isDeleted});

  TransactionDetail.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    trasnactionId = json['TrasnactionId'];
    guest = json['Guest'] != null ? new Guest.fromJson(json['Guest']) : null;
    guestId = json['GuestId'];
    arrivalDateTime = json['ArrivalDateTime'];
    addedDate = json['AddedDate'];
    lastUpdatedDate = json['LastUpdatedDate'];
    isDeleted = json['IsDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['TrasnactionId'] = this.trasnactionId;
    if (this.guest != null) {
      data['Guest'] = this.guest!.toJson();
    }
    data['GuestId'] = this.guestId;
    data['ArrivalDateTime'] = this.arrivalDateTime;
    data['AddedDate'] = this.addedDate;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['IsDeleted'] = this.isDeleted;
    return data;
  }
}

class Guest {
  int? id;
  String? name;
  String? surName;
  dynamic nationalId;
  dynamic image;
  dynamic addedDate;
  dynamic lastUpdatedDate;
  bool? isDeleted;

  Guest(
      {this.id,
      this.name,
      this.surName,
      this.nationalId,
      this.image,
      this.addedDate,
      this.lastUpdatedDate,
      this.isDeleted});

  Guest.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    surName = json['SurName'];
    nationalId = json['NationalId'];
    image = json['Image'];
    addedDate = json['AddedDate'];
    lastUpdatedDate = json['LastUpdatedDate'];
    isDeleted = json['IsDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['SurName'] = this.surName;
    data['NationalId'] = this.nationalId;
    data['Image'] = this.image;
    data['AddedDate'] = this.addedDate;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['IsDeleted'] = this.isDeleted;
    return data;
  }
}
// class LocationDetails {
//   int id;
//   String name;

//   LocationDetails({required this.id, required this.name});

//   factory LocationDetails.fromJson(Map<String, dynamic> json) =>
//       LocationDetails(
//         id: json['Id'],
//         name: json['Name'],
//       );
// }

// class Guest {
//   int id;
//   String name;
//   String surName;

//   Guest({required this.id, required this.name, required this.surName});

//   factory Guest.fromJson(Map<String, dynamic> json) => Guest(
//         id: json['Id'],
//         name: json['Name'],
//         surName: json['SurName'],
//       );
// }

// class TransactionDetail {
//   int id;
//   int transactionId;
//   Guest guest;
//   int guestId;
//   String arrivalDateTime;

//   TransactionDetail({
//     required this.id,
//     required this.transactionId,
//     required this.guest,
//     required this.guestId,
//     required this.arrivalDateTime,
//   });

//   factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
//       TransactionDetail(
//         id: json['Id'],
//         transactionId: json['TrasnactionId'],
//         guest: Guest.fromJson(json['Guest']),
//         guestId: json['GuestId'],
//         arrivalDateTime: json['ArrivalDateTime'],
//       );
// }

// class Driver {
//   int id;
//   String name;

//   Driver({required this.id, required this.name});

//   factory Driver.fromJson(Map<String, dynamic> json) => Driver(
//         id: json['Id'],
//         name: json['Name'],
//       );
// }

// class Car {
//   int id;
//   String name;

//   Car({required this.id, required this.name});

//   factory Car.fromJson(Map<String, dynamic> json) => Car(
//         id: json['Id'],
//         name: json['Name'],
//       );
// }

// class Transaction {
//   int id;
//   int locationFromId;
//   LocationDetails locationFrom;
//   int locationToId;
//   LocationDetails locationTo;
//   dynamic guestId;
//   dynamic guest;
//   int driverId;
//   Driver driver;
//   int carId;
//   Car car;
//   String flightNumber;
//   String arrivalDateTime;
//   int terminal;
//   int currentTransactionStatus;
//   String coordinatorPhoneNumber;
//   String plateNumber;
//   String note;
//   bool isDeleted;
//   bool isConfirmed;
//   List<TransactionDetail> transactionDetails;
//   String transactionStatusName;
//   int numbersOfGuest;
//   int carTypeId;

//   Transaction({
//     required this.id,
//     required this.locationFromId,
//     required this.locationFrom,
//     required this.locationToId,
//     required this.locationTo,
//     required this.guestId,
//     required this.guest,
//     required this.driverId,
//     required this.driver,
//     required this.carId,
//     required this.car,
//     required this.flightNumber,
//     required this.arrivalDateTime,
//     required this.terminal,
//     required this.currentTransactionStatus,
//     required this.coordinatorPhoneNumber,
//     required this.plateNumber,
//     required this.note,
//     required this.isDeleted,
//     required this.isConfirmed,
//     required this.transactionDetails,
//     required this.transactionStatusName,
//     required this.numbersOfGuest,
//     required this.carTypeId,
//   });

//   factory Transaction.fromJson(Map<String, dynamic> json) {
//     var transactionDetailsList = json['TransactionDetails'] as List<dynamic>;
//     List<TransactionDetail> transactionDetails = transactionDetailsList
//         .map((detail) => TransactionDetail.fromJson(detail))
//         .toList();

//     return Transaction(
//       id: json['Id'],
//       locationFromId: json['LocationFromId'],
//       locationFrom: LocationDetails.fromJson(json['LocationFrom']),
//       locationToId: json['LocationToId'],
//       locationTo: LocationDetails.fromJson(json['LocationTo']),
//       guestId: json['GuestId'],
//       guest: Guest.fromJson(json['Guest']),
//       driverId: json['DriverId'],
//       driver: Driver.fromJson(json['Driver']),
//       carId: json['CarId'],
//       car: Car.fromJson(json['Car']),
//       flightNumber: json['FlightNumber'],
//       arrivalDateTime: json['ArrivalDateTime'],
//       terminal: json['Terminal'],
//       currentTransactionStatus: json['CurrentTransactionStatus'],
//       coordinatorPhoneNumber: json['CoordinatorPhoneNumber'],
//       plateNumber: json['PlateNumber'],
//       note: json['Note'],
//       isDeleted: json['IsDeleted'],
//       isConfirmed: json['IsConfirmed'],
//       transactionDetails: transactionDetails,
//       transactionStatusName: json['TransactionStatusName'],
//       numbersOfGuest: json['NumbersOfGuest'],
//       carTypeId: json['CarTypeId'],
//     );
//   }
// }
