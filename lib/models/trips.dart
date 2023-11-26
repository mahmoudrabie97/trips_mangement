class Trip {
  int? id;
  int? locationFromId;
  LocationFrom? locationFrom;
  int? companyId;
 dynamic company;
  int? locationToId;
  LocationFrom? locationTo;
  dynamic guestId;
  dynamic guest;
  int? driverId;
  LocationFrom? driver;
  dynamic carId;
  dynamic car;
  String? flightNumber;
  String? arrivalDateTime;
  String? arrivalDateTimeFormat;
  int? terminal;
 dynamic coordinatorPhonNumber;
  int? currentTransactionStatus;
  String? transactionStatusName;
  String? addedDate;
  bool? isConfirmed;
dynamic carTypeId;
  dynamic carType;
  int? numbersOfGuest;
  String? note;

  Trip(
      {this.id,
      this.locationFromId,
      this.locationFrom,
      this.companyId,
      this.company,
      this.locationToId,
      this.locationTo,
      this.guestId,
      this.guest,
      this.driverId,
      this.driver,
      this.carId,
      this.car,
      this.flightNumber,
      this.arrivalDateTime,
      this.arrivalDateTimeFormat,
      this.terminal,
      this.coordinatorPhonNumber,
      this.currentTransactionStatus,
      this.transactionStatusName,
      this.addedDate,
      this.isConfirmed,
      this.carTypeId,
      this.carType,
      this.numbersOfGuest,
      this.note});

  Trip.fromJson(Map<String, dynamic> json) {
    
    id = json['Id'];
    locationFromId = json['LocationFromId'];
    locationFrom = json['LocationFrom'] != null
        ? new LocationFrom.fromJson(json['LocationFrom'])
        : null;
    companyId = json['CompanyId'];
    company = json['Company'];
    locationToId = json['LocationToId'];
    locationTo = json['LocationTo'] != null
        ? new LocationFrom.fromJson(json['LocationTo'])
        : null;
    guestId = json['GuestId'];
    guest = json['Guest'];
    driverId = json['DriverId'];
    driver = json['Driver'] != null
        ? new LocationFrom.fromJson(json['Driver'])
        : null;
    carId = json['CarId'];
    car = json['Car'];
    flightNumber = json['FlightNumber'];
    arrivalDateTime = json['ArrivalDateTime'];
    arrivalDateTimeFormat = json['ArrivalDateTimeFormat'];
    terminal = json['Terminal'];
    coordinatorPhonNumber = json['CoordinatorPhonNumber'];
    currentTransactionStatus = json['CurrentTransactionStatus'];
    transactionStatusName = json['TransactionStatusName'];
    addedDate = json['AddedDate'];
    isConfirmed = json['IsConfirmed'];
    carTypeId = json['CarTypeId'];
    carType = json['CarType'];
    numbersOfGuest = json['NumbersOfGuest'];
    note = json['Note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['LocationFromId'] = this.locationFromId;
    if (this.locationFrom != null) {
      data['LocationFrom'] = this.locationFrom!.toJson();
    }
    data['CompanyId'] = this.companyId;
    data['Company'] = this.company;
    data['LocationToId'] = this.locationToId;
    if (this.locationTo != null) {
      data['LocationTo'] = this.locationTo!.toJson();
    }
    data['GuestId'] = this.guestId;
    data['Guest'] = this.guest;
    data['DriverId'] = this.driverId;
    if (this.driver != null) {
      data['Driver'] = this.driver!.toJson();
    }
    data['CarId'] = this.carId;
    data['Car'] = this.car;
    data['FlightNumber'] = this.flightNumber;
    data['ArrivalDateTime'] = this.arrivalDateTime;
    data['ArrivalDateTimeFormat'] = this.arrivalDateTimeFormat;
    data['Terminal'] = this.terminal;
    data['CoordinatorPhonNumber'] = this.coordinatorPhonNumber;
    data['CurrentTransactionStatus'] = this.currentTransactionStatus;
    data['TransactionStatusName'] = this.transactionStatusName;
    data['AddedDate'] = this.addedDate;
    data['IsConfirmed'] = this.isConfirmed;
    data['CarTypeId'] = this.carTypeId;
    data['CarType'] = this.carType;
    data['NumbersOfGuest'] = this.numbersOfGuest;
    data['Note'] = this.note;
    return data;
  }
}

class LocationFrom {
  int? id;
  String? name;

  LocationFrom({this.id, this.name});

  LocationFrom.fromJson(Map<String, dynamic> json) {
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
