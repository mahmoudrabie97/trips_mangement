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

  // الدايره اللي انت ماشي ناحيتها او في range بتاعها

  List<Trip> getTripsForCurrentUserList = [];
  List<Trip> getPickedUpTransactionslist = [];
  List<Trip> getcomplertedTransactionslist = [];

  Ride? ride;
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
  }

  void getTripsForCurrentUser({required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(GetTripsForCurrentUserLoadingState());
    getTripsForCurrentUserList = [];
    CallApi.getData(
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
        print(
            'sssssssssssssssssssssssssss ${getTripsForCurrentUserList[0].arrivalDateTime}');

        emit(GetTripsForCurrentUserSucessState());
      }
    }).catchError((error) {
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
        print(
            'sssssssssssssssssssssssssss ${getPickedUpTransactionslist[0].arrivalDateTime}');

        emit(GetPickedUpTransactionsSucessState());
      }
    }).catchError((error) {
      emit(GetPickedUpTransactionsErrorState());
    });
  }

  void getcompletedTransactions({required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(GetCompletedTransactionsrLoadingState());
    getcomplertedTransactionslist = [];
    CallApi.getData(
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

  Future getTripsDetails({required BuildContext context, required int id}) {
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
        debugPrint(value.body);
        final responseBody = json.decode(value.body);
        print(responseBody);
        ride = Ride.fromJson(responseBody);

        emit(GetTripsdetailsSucessState());
      }
    }).catchError((error) {
      emit(GetTripsdetailsErrorState());
    });
  }

  Future changetripStatus({required Map data, required BuildContext context}) {
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
    ).then((value) {
      final responseBody = json.decode(value!.body);
      if (ride!.currentTransactionStatus == 1) {
        ride!.currentTransactionStatus = 2;
        ShowMyDialog.showMsg(context, responseBody['Message'], 'message');
      } else if (ride!.currentTransactionStatus == 2) {
        ride!.currentTransactionStatus = 3;

        ShowMyDialog.showMsg(context, responseBody['Message'], 'message');
      }
      emit(ChangeTripStatusSucessState());
    }).catchError((error) {
      emit(ChangeTripStatusErrorState());
    });
  }

  void onmapcreated(GoogleMapController mapController) async {
    AppConstant.googleMapController = mapController;
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
        LatLng newLatlng =
            LatLng(locationData.latitude, locationData.longitude);
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
    LatLng latLng = LatLng(location.latitude, location.longitude);
    origin = Marker(
      markerId: const MarkerId('driver'),
      position: latLng,
      //icon: BitmapDescriptor.fromBytes(imageData),
      icon: BitmapDescriptor.defaultMarker,
      flat: true,
      draggable: false,
      zIndex: 2,
      rotation: location.heading,
    );
    circle = Circle(
        circleId: const CircleId('car'),
        center: latLng,
        radius: location.accuracy,
        strokeColor: Colors.amber,
        zIndex: 1,
        fillColor: Colors.amber.withAlpha(60));
    emit(UpdatedLocationsuccessState());
  }
}
