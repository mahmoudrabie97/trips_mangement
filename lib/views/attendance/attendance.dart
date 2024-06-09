import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/utilites/extentionhelper.dart';
import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:drive_app/views/attendance/widgets/attendance_item.dart';
import 'package:drive_app/views/attendance/widgets/custom_information_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  void initState() {
    HomeCubit.get(context).getDriverTodayShifts(context: context);
    HomeCubit.get(context).getcurrentLocation();
    HomeCubit.get(context).getDriverInfo(context: context);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // HomeShiftCubit.get(context).getCurrentLocation();
    //HomeShiftCubit.get(context).getCurrentLocation();
    print(
        'test lattttttttttttttttt${HomeCubit.get(context).newLatlng.latitude}');
    print('test longgggggggg${HomeCubit.get(context).newLatlng.longitude}');

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: LiquidPullRefresh(
          color: Colors.amber,
          backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
          height: 150,
          onRefresh: () async {
            print('KKKKKKKKKKKKK');
            return await Future.delayed(const Duration(seconds: 1))
                .then((value) {
              HomeCubit.get(context).getDriverTodayShifts(context: context);
            });
          },
          child: HomeCubit.get(context).getDrivertodayshiftsList.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Center(
                        child: Text(
                          'No Shifts found today',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    children: [
                      const CustomInformationRow(),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomText(
                        text: 'Today Shifts',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Text(
                      //     'carName',
                      //     style: TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 14,
                      // ),
                      // const CustomText(
                      //   text: 'plate number ',
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      HomeCubit.get(context).state
                                  is GetTodayShiftsLoadingState ||
                              HomeCubit.get(context).state
                                  is CheckedinOutLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.amber,
                              ),
                            )
                          : SizedBox(
                              height: context.screenheight - 200,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  //  HomeCubit.get(context).changeAttnedenceStatus(context: context, shift: HomeCubit.get(context).getDrivertodayshiftsList[index], longtiude: 1, latiude: 2, status: )

                                  return Attendanceitem(
                                    shift: HomeCubit.get(context)
                                        .getDrivertodayshiftsList[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 12,
                                  );
                                },
                                itemCount: HomeCubit.get(context)
                                    .getDrivertodayshiftsList
                                    .length,
                              ),
                            ),
                    ],
                  ),
                ),
        ));
      },
    );
  }
}
