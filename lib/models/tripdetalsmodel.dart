class TripDetailsModel {
  int? id;
  String? carName;
  String? plateNumber;
  String? coordinatorName;
  String? driverName;
  int? tripStatus;
  String? description;

  TripDetailsModel(
      {this.id,
      this.carName,
      this.plateNumber,
      this.coordinatorName,
      this.driverName,
      this.tripStatus,
      this.description});

  TripDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    carName = json['CarName'];
    plateNumber = json['PlateNumber'];
    coordinatorName = json['CoordinatorName'];
    driverName = json['DriverName'];
    tripStatus = json['TripStatus'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['CarName'] = carName;
    data['PlateNumber'] = plateNumber;
    data['CoordinatorName'] = coordinatorName;
    data['DriverName'] = driverName;
    data['TripStatus'] = tripStatus;
    data['Description'] = description;
    return data;
  }
}
