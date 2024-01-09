import 'dart:async';

import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/constants.dart';
import 'package:drive_app/utilites/custommethods.dart';
import 'package:drive_app/utilites/widgets/custombutton.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:drive_app/views/taskdetails/widgets/customerdetails.dart';
import 'package:drive_app/views/taskdetails/widgets/locationsinfo.dart';
import 'package:drive_app/views/taskdetails/widgets/userinformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen(
      {Key? key, required this.tripipid, required this.currentstatus})
      : super(key: key);
  final int tripipid;
  final int currentstatus;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
// 1- assignmt
  Timer? timer;
  int? status;

  @override
  void dispose() {
    HomeCubit.get(context).stopTimer();
    super.dispose();
  }

  // void startTimer() {
  //   const duration = Duration(seconds: 20);

  //   timer = Timer.periodic(duration, (Timer t) {
  //     HomeCubit.get(context).changemessgestatus(false);
  //     Map data = {
  //       "Id": '0',
  //       "TransactionId": widget.tripipid.toString(),
  //       "TransactionStatus": status == 2 ? '2' : '3',
  //       "AddedDate": "2023-06-20T15:43:45.773Z",
  //       "Long": HomeCubit.get(context).newLatlng.longitude.toString(),
  //       "Lat": HomeCubit.get(context).newLatlng.latitude.toString(),
  //       "IsDeleted": 'false'
  //     };
  //     HomeCubit.get(context).changetripStatus(
  //       stt: false,
  //       data: data,
  //       context: context,
  //     );
  //     HomeCubit.get(context)
  //         .getTripsDetails(context: context, id: widget.tripipid);
  //   });
  // }

  // void stopTimer() {
  //   timer?.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    //print('pppppppppppppppppp ${widget.tripipid}');
    print(
        'locccccccccccccc${HomeCubit.get(context).newLatlng.latitude.toString()} ');
    print(
        'locccccccccccccc${HomeCubit.get(context).newLatlng.longitude.toString()} ');
    print('herrrrrrrrrrrrrrrrrrrrrrrr');
    HomeCubit.get(context).getTripsDetails(
        context: context, id: widget.tripipid, currentst: widget.currentstatus);

    HomeCubit.get(context).getcurrentLocation();
    return Scaffold(
      appBar: detailspageappbar(
          context,
          Text('Trip Details',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18)),
          false),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          final ride = HomeCubit.get(context).ride;

          if (ride == null) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: UserInformationWidget(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomerDetails(),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: SizedBox(
                          height: 255,
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: AppConstant.kGoogposition,
                            onMapCreated: (GoogleMapController googlemap) {
                              HomeCubit.get(context).onmapcreated(googlemap);
                            },
                            markers: Set.of(
                                (HomeCubit.get(context).origin != null
                                    ? [HomeCubit.get(context).origin]
                                    : [])),
                            circles: Set.of(
                                (HomeCubit.get(context).circle != null
                                    ? [HomeCubit.get(context).circle]
                                    : [])),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                                text: 'Date & Time ', fontSize: 12),
                            CustomText(
                              text: ride.arrivalDateTime ?? '',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const LocationsInfo(),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ride.currentTransactionStatus == 1
                            ? CustomButton(
                                buttonText: 'Pick Up',
                                onPressed: () {
                                  status = 2;

                                  HomeCubit.get(context).startTimer(
                                    context: context,
                                    id: widget.tripipid,
                                    status: status,
                                    currentst: widget.currentstatus,
                                  );

                                  HomeCubit.get(context)
                                      .changemessgestatus(true);
                                  Map data = {
                                    "Id": '0',
                                    "TransactionId": widget.tripipid.toString(),
                                    "TransactionStatus": '2',
                                    "AddedDate": "2023-06-20T15:43:45.773Z",
                                    "Long": HomeCubit.get(context)
                                        .newLatlng
                                        .longitude
                                        .toString(),
                                    "Lat": HomeCubit.get(context)
                                        .newLatlng
                                        .latitude
                                        .toString(),
                                    "IsDeleted": 'false'
                                  };
                                  HomeCubit.get(context).changetripStatus(
                                      currst: widget.currentstatus,
                                      stt: true,
                                      data: data,
                                      context: context,
                                      id: widget.tripipid);
                                  //  HomeCubit.get(context).getTripsDetails(
                                  //  context: context, id: widget.tripipid);
                                },
                                buttonColor: AppColor.mainColor,
                                txtColor: Colors.black,
                                borderRadius: 15,
                              )
                            : ride.currentTransactionStatus == 2
                                ? CustomButton(
                                    buttonText: 'done',
                                    onPressed: () {
                                      HomeCubit.get(context)
                                          .changemessgestatus(true);

                                      status = 3;

                                      //HomeCubit.get(context).stopTimer();
                                      Map data = {
                                        "Id": '0',
                                        "TransactionId":
                                            widget.tripipid.toString(),
                                        "TransactionStatus": '3',
                                        "AddedDate": "2023-06-20T15:43:45.773Z",
                                        "Long": HomeCubit.get(context)
                                            .newLatlng
                                            .longitude
                                            .toString(),
                                        "Lat": HomeCubit.get(context)
                                            .newLatlng
                                            .latitude
                                            .toString(),
                                        "IsDeleted": 'false'
                                      };
                                      HomeCubit.get(context).changetripStatus(
                                          currst: widget.currentstatus,
                                          stt: true,
                                          data: data,
                                          context: context,
                                          id: widget.tripipid);
                                      // HomeCubit.get(context).getTripsDetails(
                                      //   context: context,
                                      // id: widget.tripipid);
                                    },
                                    buttonColor: Colors.green,
                                    txtColor: Colors.black,
                                    borderRadius: 15,
                                  )
                                : CustomButton(
                                    buttonText:
                                        ride.currentTransactionStatus == 3
                                            ? 'reset car'
                                            : 'completed',
                                    onPressed: () {
                                      HomeCubit.get(context)
                                          .changemessgestatus(true);

                                      HomeCubit.get(context).stopTimer();
                                      Map data = {
                                        "Id": '0',
                                        "TransactionId":
                                            widget.tripipid.toString(),
                                        "TransactionStatus": '4',
                                        "AddedDate": "2023-06-20T15:43:45.773Z",
                                        "Long": HomeCubit.get(context)
                                            .newLatlng
                                            .longitude
                                            .toString(),
                                        "Lat": HomeCubit.get(context)
                                            .newLatlng
                                            .latitude
                                            .toString(),
                                        "IsDeleted": 'false'
                                      };
                                      HomeCubit.get(context).changetripStatus(
                                          currst: widget.currentstatus,
                                          stt: true,
                                          data: data,
                                          context: context,
                                          id: widget.tripipid);
                                      //HomeCubit.get(context).getTripsDetails(
                                      // context: context,
                                      // id: widget.tripipid);
                                    },
                                    buttonColor: Colors.green,
                                    txtColor: Colors.black,
                                    borderRadius: 15,
                                  ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // CustomButton(
                      //   buttonText: HomeCubit.get(context).getchckedstatus(
                      //       currentstatus: widget.currentstatus),
                      //   onPressed: () {},
                      //   buttonColor: Colors.green,
                      // )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
