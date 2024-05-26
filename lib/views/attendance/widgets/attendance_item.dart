import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/cubit/homecubit/homestates.dart';
import 'package:drive_app/models/shiftmodel.dart';
import 'package:drive_app/utilites/constants.dart';
import 'package:drive_app/utilites/widgets/custombutton.dart';
import 'package:drive_app/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:lottie/lottie.dart';

import '../../../utilites/widgets/customtext.dart';

class Attendanceitem extends StatelessWidget {
  const Attendanceitem({
    super.key,
    required this.shift,
  });
  // final ShiftDetails? shiftModel;
  final ShiftModel? shift;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        // margin: const EdgeInsets.all(10),
        color: const Color(0xffF0F1F3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 14,
            ),
            CardRowWidget(
              text: shift!.fromLocationName ?? ' ',
              icondata: Icons.location_on_sharp,
            ),
            CardRowWidget(
                text: shift!.scheduledShiftStart ?? ' ',
                icondata: Icons.watch_later_outlined),
            CardRowWidget(
                text: shift!.plateNumber.toString(),
                icondata: Icons.car_repair),
            CardRowWidget(
                text: shift!.coordinatorName ?? ' ',
                icondata: Icons.person_2_sharp),

            const SizedBox(
              height: 10,
            ),
            BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: CustomButton(
                      buttonText: HomeCubit.get(context)
                          .getchckedstatusfordriver(shiftModel: shift),
                      onPressed: () {
                        HomeCubit.get(context)
                            .changeAttnedenceStatus(
                              context: context,
                              shift: shift,
                              longtiude: HomeCubit.get(context)
                                  .newLatlng
                                  .longitude
                                  .toString(),
                              latiude: HomeCubit.get(context)
                                  .newLatlng
                                  .latitude
                                  .toString(),
                              status: shift!.lastAttendenceStatus == null ||
                                      shift!.lastAttendenceStatus == 1
                                  ? '0'
                                  : '1',
                            )
                            .then((value) {});
                        if (AppConstant.showmessage != '') {
                          ShowMyDialog.showMsg(
                              context, AppConstant.showmessage, '');
                        }
                      },
                      buttonColor: Colors.amber,
                      borderRadius: 0,
                    ),
                  ),
                );
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: SizedBox(
            //     height: 40,
            //     child: BlocConsumer<HomeShiftCubit, HomeShiftStates>(
            //       listener: (BuildContext context, state) {},
            //       builder: (BuildContext context, Object? state) {
            //         return CustomButtonTest(
            //           buttonText: HomeShiftCubit.get(context)
            //               .getchckedstatus(shiftModel: shiftModel),
            //           onPressed: () async {
            //             var cubit = HomeShiftCubit.get(context);
            //             // HomeShiftCubit.get(context).getCurrentLocation();
            //             if (cubit.getchckedstatus(shiftModel: shiftModel) ==
            //                 'Done') {
            //               return;
            //             }
            //             cubit.checkedinout(
            //                 context: context, shiftDetails: shiftModel);
            //           },
            //           buttonColor: HomeShiftCubit.get(context)
            //                       .getchckedstatus(shiftModel: shiftModel) ==
            //                   'Done'
            //               ? Colors.green
            //               : const Color(0xff9B0F18),
            //           borderRadius: 12,
            //         );
            //       },
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  // void showDialoog(BuildContext context) => showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) => Dialog(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Lottie.asset('assets/images/ddone.json',
  //                   repeat: false,
  //                   height: 100,
  //                   alignment: Alignment.center,
  //                   fit: BoxFit.cover),
  //             ],
  //           ),
  //         ));
}

class CardRowWidget extends StatelessWidget {
  const CardRowWidget({
    super.key,
    required this.text,
    required this.icondata,
  });
  final String text;
  final IconData icondata;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icondata,
            color: Colors.amber,
          ),
          SizedBox(
            width: 5,
          ),
          CustomText(
            text: text,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),
          // Padding(
          //   padding: const EdgeInsets.only(right: 10),
          //   child: InkWell(
          //     onTap: () {
          //       context.push(const PeroidDetails());
          //     },
          //     child: const CustomText(
          //       text: 'view',
          //       color: Colors.red,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
