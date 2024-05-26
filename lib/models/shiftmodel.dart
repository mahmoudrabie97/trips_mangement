class ShiftModel {
  int? id;
  int? driverId;
  String? driverName;
  int? carId;
  String? carName;
  int? coordinatorId;
  String? coordinatorName;
  String? plateNumber;
  String? scheduledShiftStart;
  int? fromLocationId;
  String? fromLocationName;
  int? toLocationId;
  double? locationLong;
  double? locationLat;
  dynamic toLocationName;
  dynamic tripStatus;
  int? carStatus;
  String? date;
  String? addedDate;
  int? workingHours;
  int? lastAttendenceStatus;

  ShiftModel(
      {this.id,
      this.driverId,
      this.driverName,
      this.carId,
      this.carName,
      this.coordinatorId,
      this.coordinatorName,
      this.plateNumber,
      this.scheduledShiftStart,
      this.fromLocationId,
      this.fromLocationName,
      this.toLocationId,
      this.locationLong,
      this.locationLat,
      this.toLocationName,
      this.tripStatus,
      this.carStatus,
      this.date,
      this.addedDate,
      this.workingHours,
      this.lastAttendenceStatus});

  ShiftModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    driverId = json['DriverId'];
    driverName = json['DriverName'];
    carId = json['CarId'];
    carName = json['CarName'];
    coordinatorId = json['CoordinatorId'];
    coordinatorName = json['CoordinatorName'];
    plateNumber = json['PlateNumber'];
    scheduledShiftStart = json['ScheduledShiftStart'];
    fromLocationId = json['FromLocationId'];
    fromLocationName = json['FromLocationName'];
    toLocationId = json['ToLocationId'];
    locationLong = json['LocationLong'];
    locationLat = json['LocationLat'];
    toLocationName = json['ToLocationName'];
    tripStatus = json['TripStatus'];
    carStatus = json['CarStatus'];
    date = json['Date'];
    addedDate = json['AddedDate'];
    workingHours = json['WorkingHours'];
    lastAttendenceStatus = json['LastAttendenceStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['DriverId'] = driverId;
    data['DriverName'] = driverName;
    data['CarId'] = carId;
    data['CarName'] = carName;
    data['CoordinatorId'] = coordinatorId;
    data['CoordinatorName'] = coordinatorName;
    data['PlateNumber'] = plateNumber;
    data['ScheduledShiftStart'] = scheduledShiftStart;
    data['FromLocationId'] = fromLocationId;
    data['FromLocationName'] = fromLocationName;
    data['ToLocationId'] = toLocationId;
    data['LocationLong'] = locationLong;
    data['LocationLat'] = locationLat;
    data['ToLocationName'] = toLocationName;
    data['TripStatus'] = tripStatus;
    data['CarStatus'] = carStatus;
    data['Date'] = date;
    data['AddedDate'] = addedDate;
    data['WorkingHours'] = workingHours;
    data['LastAttendenceStatus'] = lastAttendenceStatus;
    return data;
  }
}
