import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/models/tripdetailsmodel.dart';
import 'package:drive_app/models/trips.dart';
import 'package:drive_app/network/api.dart';
import 'package:drive_app/network/endpoints.dart';
import 'package:drive_app/utilites/constants.dart';
import 'package:drive_app/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeCubit extends Cubit<HomeStates> {
  static HomeCubit get(context) => BlocProvider.of(context);
  StreamSubscription? subscription;
  Location livelocation = Location();
  late Marker origin; //ده اللي بيعلم علي مكانك وانت في map
  late Circle circle;
  DateTime? selecteddate;
  bool IshShowMessage = false;
  Timer? timer;
  bool iscleared = false;

  Completer<GoogleMapController> mapController = Completer();

  // الدايره اللي انت ماشي ناحيتها او في range بتاعها

  List<Trip> getTripsForCurrentUserList = [];
  List<Trip> getPickedUpTransactionslist = [];
  List<Trip> getcomplertedTransactionslist = [];
  List<Trip> getfiltercomplertedTransactionslist = [];
  List<Trip> getfilterTripsForPickedUpList = [];
  List<Trip> getfilterTripsForHomeList = [];

  Transaction? ride;
  late LatLng newLatlng;
  HomeCubit() : super(InitialHomeState()) {
    origin = const Marker(
        markerId: MarkerId('driver'),
        position: LatLng(30.42796133580664, 31.085749655962),
        flat: true,
        draggable: false);
    circle = Circle(
        circleId: const CircleId('car'),
        center: const LatLng(30.42796133580664, 31.085749655962),
        strokeColor: Colors.amber,
        zIndex: 1,
        fillColor: Colors.amber.withAlpha(60));
    newLatlng = const LatLng(28.1078099, 30.749215);
  }
  void clearFilter() {
    selecteddate = null;
    iscleared = true;
    emit(ClearFilter());
  }

  Future getTripsForCurrentUser({required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(GetTripsForCurrentUserLoadingState());
    getTripsForCurrentUserList = [];
    selecteddate = null;
    return CallApi.getData(
            baseUrl: baseurl,
            apiUrl: getTripsForCurrentUserurl,
            context: context,
            headers: headers)
        .then((value) {
      if (value!.statusCode == 200) {
        debugPrint(value.body);
        final responseBody = json.decode(value.body);
        print(responseBody);
        for (var item in responseBody) {
          getTripsForCurrentUserList.add(Trip.fromJson(item));
        }

        emit(GetTripsForCurrentUserSucessState());
      }
    }).catchError((error) {
      print('erroryyyy $error');
      emit(GetTripsForCurrentUserErrorState());
    });
  }

  void getPickedUpTransactionsByDriverId({required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(GetPickedUpTransactionsrLoadingState());
    getPickedUpTransactionslist = [];
    selecteddate = null;
    CallApi.getData(
            baseUrl: baseurl,
            apiUrl: getPickedUpTransactionsByDriverIdUrl,
            context: context,
            headers: headers)
        .then((value) {
      if (value!.statusCode == 200) {
        debugPrint(value.body);
        final responseBody = json.decode(value.body);
        print(responseBody);
        for (var item in responseBody) {
          getPickedUpTransactionslist.add(Trip.fromJson(item));
        }

        emit(GetPickedUpTransactionsSucessState());
      }
    }).catchError((error) {
      emit(GetPickedUpTransactionsErrorState());
    });
  }

  Future getcompletedTransactions({required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(GetCompletedTransactionsrLoadingState());
    getcomplertedTransactionslist = [];
    selecteddate = null;
    return CallApi.getData(
            baseUrl: baseurl,
            apiUrl: getFinishedTransactionsUrl,
            context: context,
            headers: headers)
        .then((value) {
      if (value!.statusCode == 200) {
        debugPrint(value.body);
        final responseBody = json.decode(value.body);
        print(responseBody);
        for (var item in responseBody) {
          getcomplertedTransactionslist.add(Trip.fromJson(item));
        }

        emit(GetCompletedTransactionsSucessState());
      }
    }).catchError((error) {
      emit(GetCompletedTransactionsErrorState());
    });
  }

  Future getTripsDetails(
      {required BuildContext context,
      required int id,
      required int currentst}) {
    emit(GetTripsdetailsLoadingState());

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    return CallApi.getData(
      baseUrl: baseurl,
      apiUrl: '$getTripDetailsurl?tripId=$id',
      context: context,
      headers: headers,
    ).then((value) {
      if (value!.statusCode == 200) {
        getchckedstatus(currentstatus: currentst);
        debugPrint('vvvvvvvvvvvvvvvvvvvvvvv ${value.body}');
        final responseBody = json.decode(value.body);
        print(responseBody);
        ride = Transaction.fromJson(responseBody);
        print("hhhhhhhhhhhhhhhhhhhhh$ride");

        emit(GetTripsdetailsSucessState());
      }
    }).catchError((error) {
      print('rrrrrrrrrrrrrrrrrrrrrr$error');
      emit(GetTripsdetailsErrorState());
    });
  }

  void changemessgestatus(bool st) {
    IshShowMessage = st;
    emit(ChangestState());
  }

  Future changeingtripStatus(
      {required Map data,
      required BuildContext context,
      required int id,
      required int currst}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(ChangeTripStatusLoadingState());
    return CallApi.postData(
      data: data,
      baseUrl: baseurl,
      apiUrl: changeTripStatusurl,
      headers: headers,
      context: context,
      st: false,
    ).then((value) {
      if (value!.statusCode == 200) {
        getchckedstatus(currentstatus: currst);
        getTripsDetails(context: context, id: id, currentst: currst);

        print(value.body);
      }
    }).catchError((error) {
      print(error);
    });
  }

  Future changetripStatus(
      {required Map data,
      required BuildContext context,
      required bool stt,
      required int id,
      required int currst}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(ChangeTripStatusLoadingState());
    return CallApi.postData(
      data: data,
      baseUrl: baseurl,
      apiUrl: changeTripStatusurl,
      headers: headers,
      context: context,
      st: stt,
    ).then((value) {
      final responseBody = json.decode(value!.body);
      if (ride!.currentTransactionStatus == 1) {
        ride!.currentTransactionStatus = 2;
        if (IshShowMessage == true) {
          ShowMyDialog.showMsg(context, responseBody['Message'], 'message');
        }
      } else if (ride!.currentTransactionStatus == 2) {
        ride!.currentTransactionStatus = 3;
        if (IshShowMessage == true) {
          ShowMyDialog.showMsg(context, responseBody['Message'], 'message');
        }
      } else if (ride!.currentTransactionStatus == 3) {
        ride!.currentTransactionStatus = 4;
        if (IshShowMessage == true) {
          ShowMyDialog.showMsg(context, responseBody['Message'], 'message');
        }
      }
      getTripsDetails(context: context, id: id, currentst: currst);
      emit(ChangeTripStatusSucessState());
    }).catchError((error) {
      print('ggggggggggggggg$error');
      emit(ChangeTripStatusErrorState());
    });
  }

  void onmapcreated(GoogleMapController controller) async {
    AppConstant.googleMapController = controller;
    //this.mapController.complete(mapController);

    emit(CreatedMapsuccessState());
  }

  Future<Uint8List> getmarker() async {
    //function استخدم صوره العربيه كmarker
    ByteData byteData = await rootBundle.load('assets/images/Untitled.png');
    return byteData.buffer.asUint8List();
  }

  getcurrentLocation() async {
    try {
      Uint8List imageData = await getmarker();
      var location = await livelocation.getLocation();
      if (subscription != null) {
        subscription!.cancel();
      }
      subscription = livelocation.onLocationChanged.listen((locationData) {
        // عملت تعديل هنا ??0 ??8
        newLatlng =
            LatLng(locationData.latitude ?? 0, locationData.longitude ?? 8);
        AppConstant.googleMapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: newLatlng, zoom: 18),
          ),
        );
        updateLocation(imageData, locationData);
      });
      updateLocation(imageData, location);
      //كل مره بجيب الlocation بعمل update
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  updateLocation(Uint8List imageData, LocationData location) {
    //المفروض الmarker اقوله انقل مكانه من هنا لهنا المكان الجديد يعني
    LatLng latLng = LatLng(location.latitude ?? 0, location.longitude ?? 0);
    origin = Marker(
      markerId: const MarkerId('driver'),
      position: latLng,
      //icon: BitmapDescriptor.fromBytes(imageData),
      icon: BitmapDescriptor.defaultMarker,
      flat: true,
      draggable: false,
      zIndex: 2,
      rotation: location.heading ?? 0,
    );
    circle = Circle(
        circleId: const CircleId('car'),
        center: latLng,
        radius: location.accuracy ?? 0,
        strokeColor: Colors.amber,
        zIndex: 1,
        fillColor: Colors.amber.withAlpha(60));
    emit(UpdatedLocationsuccessState());
  }

  void changedatePicker(DateTime t) {
    selecteddate = t;
    emit(UpdateSelectedDateState());
  }

  void filterpickedupTripsByDate(BuildContext context) {
    emit(FilterTripsByDateLoadingState());
    getfilterTripsForPickedUpList = [];

    getfilterTripsForPickedUpList = getPickedUpTransactionslist.where((trip) {
      final tripDateTime = DateTime.parse(trip.arrivalDateTime!);
      return tripDateTime.year == selecteddate!.year &&
          tripDateTime.month == selecteddate!.month &&
          tripDateTime.day == selecteddate!.day;
    }).toList();
    emit(FilterTripsByDateSuccessState());
  }

  void filterHomeTripsByDate(BuildContext context) {
    emit(FilterHomeTripsByDateLoadingState());
    getfilterTripsForHomeList = [];

    getfilterTripsForHomeList = getTripsForCurrentUserList.where((trip) {
      final tripDateTime = DateTime.parse(trip.arrivalDateTime!);

      return tripDateTime.year == selecteddate!.year &&
          tripDateTime.month == selecteddate!.month &&
          tripDateTime.day == selecteddate!.day;
    }).toList();

    emit(FilterHomeTripsByDateSuccessState());
  }

  void filterCompletedTripsByDate(BuildContext context) {
    emit(FilterCompletedTripsByDateLoadingState());
    getfiltercomplertedTransactionslist = [];

    getfiltercomplertedTransactionslist =
        getPickedUpTransactionslist.where((trip) {
      final tripDateTime = DateTime.parse(trip.arrivalDateTime!);

      return tripDateTime.year == selecteddate!.year &&
          tripDateTime.month == selecteddate!.month &&
          tripDateTime.day == selecteddate!.day;
    }).toList();
    emit(FilterCompletedTripsByDateSuccessState());
  }

  // void filterHomeTripsByDate(BuildContext context) {
  //   emit(FilterHomeTripsByDateLoadingState());
  //   getfilterTripsForHomeList = [];

  //   getfilterTripsForHomeList = getTripsForCurrentUserList
  //       .where((trip) =>
  //          return trip.arrivalDateTime!.year == selecteddate!.year &&
  //           trip.arrivalDateTime!.month == selecteddate!.month &&
  //           trip.arrivalDateTime!.day == selecteddate!.day)
  //       .toList();
  //   emit(FilterHomeTripsByDateSuccessState());
  // }

  void startTimer(
      {required BuildContext context,
      required int id,
      required int? status,
      required int currentst}) {
    const duration = Duration(seconds: 20);

    timer = Timer.periodic(duration, (Timer t) {
      changemessgestatus(false);
      Map data = {
        "Id": '0',
        "TransactionId": id.toString(),
        "TransactionStatus": status == 2 ? '2' : '3',
        "AddedDate": "2023-06-20T15:43:45.773Z",
        "Long": newLatlng.longitude.toString(),
        "Lat": newLatlng.latitude.toString(),
        "IsDeleted": 'false'
      };
      changetripStatus(
        id: id,
        stt: false,
        data: data,
        context: context,
        currst: currentst,
      );
      getTripsDetails(context: context, id: id, currentst: currentst);
    });
  }

  void stopTimer() {
    timer?.cancel();
  }
  //  String getchckedstatus({required ShiftDetails? shiftModel}) {
  //   if (shiftModel!.isCheckedIn == true && shiftModel.isCheckedOut == false) {
  //     // updateButtonText(buttonText: 'Check_out');

  //     return 'Check_out ';
  //   } else if (shiftModel.isCheckedIn == true &&
  //       shiftModel.isCheckedIn == true) {
  //     // updateButtonText(buttonText: 'Check_in ');
  //     return 'Done';
  //   } else if (shiftModel.isCheckedIn == false &&
  //       shiftModel.isCheckedOut == false) {
  //     // updateButtonText(buttonText: 'check_in');
  //     return 'check_in';
  //   } else if (shiftModel.isCheckedIn == false &&
  //       shiftModel.isCheckedOut == true) {
  //     // updateButtonText(buttonText: 'checked_in');
  //     return 'checked_in';
  //   } else {
  //     return '';
  //   }
  // }

  String getchckedstatus({required int? currentstatus}) {
    if (currentstatus == 1) {
      return 'Pick Up';
    } else if (currentstatus == 2) {
      return 'done';
    } else if (currentstatus == 3) {
      return 'reset car';
    } else {
      return 'Completed';
    }
  }
  //   if (shiftModel!.isCheckedIn == true && shiftModel.isCheckedOut == false) {
  //     // updateButtonText(buttonText: 'Check_out');

  //     return 'Check_out ';
  //   } else if (shiftModel.isCheckedIn == true &&
  //       shiftModel.isCheckedIn == true) {
  //     // updateButtonText(buttonText: 'Check_in ');
  //     return 'Done';
  //   } else if (shiftModel.isCheckedIn == false &&
  //       shiftModel.isCheckedOut == false) {
  //     // updateButtonText(buttonText: 'check_in');
  //     return 'check_in';
  //   } else if (shiftModel.isCheckedIn == false &&
  //       shiftModel.isCheckedOut == true) {
  //     // updateButtonText(buttonText: 'checked_in');
  //     return 'checked_in';
  //   } else {
  //     return '';
  //   }
  // }
}
