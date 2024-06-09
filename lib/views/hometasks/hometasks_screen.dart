import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/constants.dart';
import 'package:drive_app/utilites/custommethods.dart';
import 'package:drive_app/utilites/widgets/custombutton.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:drive_app/views/hometasks/widgets/taskitemwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class HomeTasksScreen extends StatefulWidget {
  const HomeTasksScreen({Key? key}) : super(key: key);

  @override
  State<HomeTasksScreen> createState() => _HomeTasksScreenState();
}

class _HomeTasksScreenState extends State<HomeTasksScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getDriverInfo(context: context);
    HomeCubit.get(context).getcurrentLocation();
    //HomeCubit.get(context).getDriverTodayShifts(context: context);
    if (HomeCubit.get(context).getDrivertodayshiftsList.isNotEmpty) {
      HomeCubit.get(context).getDriverTrips(context: context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        print(
            'test lattttttttttttttttt${HomeCubit.get(context).newLatlng.latitude}');
        print('test longgggggggg${HomeCubit.get(context).newLatlng.longitude}');
        return Scaffold(
          appBar: detailspageappbar(
              context,
              Text('My Trips',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18)),
              false),
          body: LiquidPullRefresh(
            color: Colors.amber,
            backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
            height: 200,
            onRefresh: () async {
              print('KKKKKKKKKKKKK');
              return await Future.delayed(const Duration(seconds: 1))
                  .then((value) {
                HomeCubit.get(context).getDriverTrips(context: context);
              });
            },
            child: HomeCubit.get(context).idcreationshift.isEmpty
                ? const Center(
                    child: Text(
                      'No Trips found',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amber),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        HomeCubit.get(context).state
                                is ChangeTripStatusLoadingState
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomButtonWithdisable(
                                        disabled: AppConstant.driverstatus == 0
                                            ? true
                                            : false,
                                        buttonText: 'Start Trip',
                                        onPressed: () async {
                                          Map data = {
                                            "Id": '0',
                                            "ShiftId": HomeCubit.get(context)
                                                .idcreationshift[0]
                                                .toString(),
                                            "TripId": "0",
                                            "Longitude": HomeCubit.get(context)
                                                .newLatlng
                                                .longitude
                                                .toString(),
                                            "Latitude": HomeCubit.get(context)
                                                .newLatlng
                                                .latitude
                                                .toString(),
                                            "TripStatus": "2",
                                          };

                                          await HomeCubit.get(context)
                                              .changetripStopStartStatus(
                                            data: data,
                                            context: context,
                                            stt: true,
                                          );
                                          HomeCubit.get(context)
                                              .startTimerForStartStop(
                                                  context: context, data: data);
                                        },
                                        buttonColor: Colors.amber,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Expanded(
                                      child: CustomButtonWithdisable(
                                        disabled: AppConstant.driverstatus == 0
                                            ? false
                                            : true,
                                        buttonText: 'End Trip',
                                        onPressed: () async {
                                          Map data = {
                                            "Id": '0',
                                            "ShiftId": HomeCubit.get(context)
                                                .idcreationshift[0]
                                                .toString(),
                                            "TripId": "0",
                                            "Longitude": HomeCubit.get(context)
                                                .newLatlng
                                                .longitude
                                                .toString(),
                                            "Latitude": HomeCubit.get(context)
                                                .newLatlng
                                                .latitude
                                                .toString(),
                                            "TripStatus": "3",
                                          };

                                          await HomeCubit.get(context)
                                              .changetripStopStartStatus(
                                            data: data,
                                            context: context,
                                            stt: true,
                                          );
                                          HomeCubit.get(context)
                                              .stopTimerForStartStop();
                                        },
                                        buttonColor: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: CustomText(
                            text: 'Today Tasks',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        state is GetTripsForCurrentUserLoadingState ||
                                state is FilterHomeTripsByDateLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: AppColor.mainColor),
                              )
                            : SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      HomeCubit.get(context).selecteddate ==
                                              null
                                          ? HomeCubit.get(context)
                                              .getDriverTripsList
                                              .length
                                          : HomeCubit.get(context)
                                              .getfilterTripsForHomeList
                                              .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // print(
                                    //   'listttttttttttttt ${HomeCubit.get(context).getTripsForCurrentUserList}');
                                    return HomeCubit.get(context)
                                                .selecteddate ==
                                            null
                                        ? TaskItemWidget(
                                            tripmodel: HomeCubit.get(context)
                                                .getDriverTripsList[index],
                                            mylist: HomeCubit.get(context)
                                                .getDriverTripsList,
                                          )
                                        : TaskItemWidget(
                                            tripmodel: HomeCubit.get(context)
                                                    .getfilterTripsForHomeList[
                                                index],
                                            mylist: HomeCubit.get(context)
                                                .getfilterTripsForHomeList,
                                          );
                                  },
                                ),
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
